# VRTX SDK — iOS Integration Guide

Everything you need to initialize, configure, and authenticate your iOS app with the VRTX SDK — including required host app configuration (Info.plist + capabilities), session behavior, and token structure.

---

## Table of Contents

1. Overview
2. Supported iOS Versions & Requirements
3. Installation
4. Quick Start
5. Required Host App Configuration (Info.plist + Capabilities)
6. SDK Callbacks & Lifecycle
7. Authentication Method & Token Structure
8. Session Expiration & Renewal
9. Configuration Reference
10. Troubleshooting

---

## 1. Overview

The VRTX SDK provides a native iOS wallet and onboarding experience (KYC, OTP, Nafath verification, wallet login, card flows) that you can present inside your host app.

The SDK is UIKit-based and presents its own `UINavigationController` flow from a host `UIViewController`.

---

## 2. Supported iOS Versions & Requirements

| Requirement | Value | Notes |
| --- | --- | --- |
| Minimum iOS version | iOS 15.6 | Set your host target to iOS 15.6 or newer |
| Language | Swift | Uses Swift concurrency (`async/await`) internally |
| UI framework | UIKit | Present the SDK from a `UIViewController` |

---

## 3. Installation

The SDK is delivered as `VRTX.framework` (or as a project you can embed). Use one of the following approaches:

### Option A — Embed `VRTX.framework` / `VRTX.xcframework`

1. Add the framework to your project.
2. In your app target:
   - Add it under “Frameworks, Libraries, and Embedded Content”
   - Set it to “Embed & Sign”
3. `import VRTX` in your host code.

### Option B — Add `VRTX.xcodeproj` as a subproject

1. Drag `VRTX/VRTX.xcodeproj` into your host app project.
2. Add `VRTX.framework` to your host target’s “Frameworks, Libraries, and Embedded Content”.
3. Ensure “Embed & Sign” is enabled.

### Transitive dependency — Sentry

The SDK ships with a scoped Sentry integration to route its own crashes and API errors to the VRTX Sentry project. This means `Sentry.framework` will appear as a transitive dependency of `VRTX.framework` — integrate as follows:

- **SwiftPM**: nothing to do; the package reference is resolved from `VRTX.xcodeproj`.
- **Embedded `.xcframework`**: you must also add `Sentry.xcframework` next to `VRTX.xcframework` in your host target (both set to “Embed & Sign”).

The SDK never calls `SentrySDK.start(...)` — it uses an isolated `SentryHub`, so your host app's own Sentry initialization is not affected. If your host app also uses Sentry, its global hub and our scoped hub coexist and report independently.

---

## 4. Quick Start

Initialization is a two-step process:

1. Configure the SDK once (environment, credentials, theme, language).
2. Start/present the SDK from a host view controller.

```swift
import UIKit
import VRTX

final class HostViewController: UIViewController {
    func startVrtx() {
        Vrtx.shared.configure(
            environment: .staging,
            grantType: "client_credentials",
            clientID: "<YOUR_CLIENT_ID>",
            clientSecret: "<YOUR_CLIENT_SECRET>",
            scope: "read sdk_scopes",
            theme: VrtxTheme(
                primaryColor: .black,
                backgroundColor: .white
            ),
            language: .english,
            licenseKey: "<YOUR_LICENSE_KEY>",
            deleteKeychain: false,
            isPhysicalCard: false
        ) { configured in
            guard configured else {
                return
            }

            Vrtx.start(from: self) { started in
                if !started {
                    // Auth token could not be fetched (network/credentials issue).
                    // Show a host-app error UI here.
                }
            }
        }
    }
}
```

Security note: never hard-code `clientSecret` (or any real production credentials) in source control.

---

## 5. Required Host App Configuration (Info.plist + Capabilities)

The SDK uses external app linking (Nafath), biometrics, and optionally NFC (for physical card activation flows). Configure the following in your host app.

### 5.1 Nafath URL Scheme (Required for Nafath deep-linking)

The official Nafath URL scheme is:

- `nafath://`

Since iOS 9, you must whitelist URL schemes you want to query via `canOpenURL`. Add this to your host app `Info.plist`:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>nafath</string>
</array>
```

### 5.2 Biometric / Face ID (Required if you enable biometrics in the SDK)

Add the Face ID usage string to your host app `Info.plist`:

```xml
<key>NSFaceIDUsageDescription</key>
<string>Use Face ID to quickly and securely access VRTX Pay</string>
```

If this key is missing, the SDK will display a configuration error when the biometric enable step is reached.

### 5.3 NFC (Required only for physical card NFC scan flows)

If you enable physical card flows (for example by setting `isPhysicalCard: true`), the SDK can use Core NFC.

1. In your host app “Signing & Capabilities”, enable:
   - Near Field Communication Tag Reading
2. Add this key to your host app `Info.plist`:

```xml
<key>NFCReaderUsageDescription</key>
<string>Scan your card securely to activate it</string>
```

3. Add ISO7816 “select identifiers” (AIDs) to your host app entitlements if your flow requires ISO7816 tags:

```xml
<key>com.apple.developer.nfc.readersession.iso7816.select-identifiers</key>
<array>
    <string>325041592E5359532E4444463031</string>
    <string>A0000000031010</string>
    <string>A0000000032010</string>
    <string>A0000000032020</string>
    <string>A0000000980840</string>
    <string>A0000000041010</string>
</array>
```

Apple will enforce entitlement validation at runtime; missing entitlements will prevent NFC scanning from working.

---

## 6. SDK Callbacks & Lifecycle

The SDK currently exposes two completion callbacks:

| API | Signature | Meaning |
| --- | --- | --- |
| Configure | `configure(..., completion: (Bool) -> Void)` | `true` when the SDK is configured and ready to start |
| Start | `start(from:completion:)` | `true` when the SDK flow is presented; `false` if the SDK auth token could not be fetched |

Practical guidance:

- Always implement the `start` completion and show a host-app error UI on failure.
- The SDK presents modally (`.fullScreen`). When the user completes or exits flows, the SDK dismisses itself from within its UI.

---

## 7. Authentication Method & Token Structure

The SDK authenticates with the VRTX backend using a client credentials flow.

### Required fields

| Field | Description |
| --- | --- |
| `grantType` | Usually `client_credentials` |
| `clientID` | Identifies the calling application |
| `clientSecret` | Authenticates the application |
| `scope` | Scopes granted for SDK operations |

The SDK requests `/auth/token` and injects the resulting bearer token into API requests.

---

## 8. Session Expiration & Renewal

The SDK maintains two kinds of tokens:

1. **SDK auth token** (client credentials):
   - Expires based on the backend-provided `expires_in`
   - Automatically refreshed by the SDK when it is close to expiring
2. **Wallet session token** (user session):
   - Stored alongside a refresh token
   - Automatically refreshed by the SDK when close to expiring
   - If refresh fails (unauthorized), the user must re-authenticate in the SDK flow

---

## 9. Configuration Reference

### `Vrtx.shared.configure(...)`

| Parameter | Type | Required | Description |
| --- | --- | --- | --- |
| `environment` | `VrtxEnvironment` | Yes | Backend base URL selection |
| `grantType` | `String` | Yes | OAuth grant type (typically `client_credentials`) |
| `clientID` | `String` | Yes | Client identifier |
| `clientSecret` | `String` | Yes | Client secret |
| `scope` | `String` | Yes | Scope string sent to `/auth/token` |
| `theme` | `VrtxTheme` | Yes | SDK UI theme |
| `language` | `VrtxLanguage` | Yes | `.english` or `.arabic` |
| `licenseKey` | `String` | Yes | License key provided by VRTX |
| `deleteKeychain` | `Bool` | No | Clears existing SDK keychain data before starting |
| `isPhysicalCard` | `Bool` | No | Enables physical card flows (may require NFC host configuration) |

### Entry point

- `Vrtx.start(from: UIViewController, completion: (Bool) -> Void)`

---

## 10. Troubleshooting

### Nafath app does not open

- Ensure `LSApplicationQueriesSchemes` includes `nafath`.

### Face ID configuration error shown by the SDK

- Add `NSFaceIDUsageDescription` to the host app `Info.plist`.

### NFC scanning does not start / immediately fails

- Ensure NFC capability is enabled for the host target.
- Add `NFCReaderUsageDescription` to the host app `Info.plist`.
- Ensure required AIDs are present in the host entitlements (`iso7816.select-identifiers`).
