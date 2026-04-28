# vrtx-ios

The official iOS SDK for Vrtx — onboarding, wallet, and card flows for your app.

## Requirements

- iOS 15.6+
- Xcode 15+
- Swift 5.9+

## Installation

### Xcode

1. **File → Add Package Dependencies…**
2. Paste the repository URL: `https://github.com/vrtx-fintech/vrtx-ios`
3. Choose a version rule (we recommend **Up to Next Major** from the latest release) and add the `VRTX` library to your target.

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/vrtx-fintech/vrtx-ios", from: "0.0.1")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [.product(name: "VRTX", package: "vrtx-ios")]
    )
]
```

## Quickstart

### 1. Configure

Call `configure` once at app launch — typically from your `AppDelegate` or
`@main` `App` struct. Credentials and the license key are issued by Vrtx.

```swift
import VRTX

Vrtx.shared.configure(
    environment: .sandbox,
    grantType: "client_credentials",
    clientID: "YOUR_CLIENT_ID",
    clientSecret: "YOUR_CLIENT_SECRET",
    scope: "YOUR_SCOPE",
    theme: .default,
    language: .english,
    licenseKey: "YOUR_LICENSE_KEY"
) { success in
    print("VRTX configured: \(success)")
}
```

### 2. Start the flow

Present the SDK from any view controller. The SDK handles onboarding or
sign-in automatically based on the user's saved state.

```swift
Vrtx.start(from: self) { started in
    // SDK is now active
}
```

### 3. Sign out

```swift
Vrtx.logout(from: self)
```

## Theming

Pass a `VrtxTheme` to `configure` to match your brand:

```swift
let theme = VrtxTheme(
    primaryColor: .systemBlue,
    secondaryColor: .systemGray
    // …
)
```

## Localization

Supported languages: English and Arabic. Set the language at configure time:

```swift
Vrtx.shared.configure(
    // …
    language: .arabic
    // …
)
```

## Support

For credentials, license keys, and integration help, contact your Vrtx
account manager or [support@vrtx.sa](mailto:support@vrtx.sa).

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for the
full text.
