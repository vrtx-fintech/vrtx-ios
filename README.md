# vrtx-ios

The official iOS SDK for Vrtx — onboarding, wallet, and card flows for your app.

## Requirements

- iOS 15.6+
- Xcode 16+
- Swift 5.9+

## Installation

### Xcode

1. **File → Add Package Dependencies…**
2. Paste the repository URL: `https://github.com/vrtx-fintech/vrtx-ios`
3. Choose a version rule (we recommend **Up to Next Major** from the latest release) and add the `VRTX` library to your target.

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/vrtx-fintech/vrtx-ios", from: "0.1.3"),
    .package(url: "https://github.com/devicekit/DeviceKit", exact: "5.7.0"),
    .package(url: "https://github.com/talsec/Free-RASP-iOS", exact: "6.14.5")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "VRTX", package: "vrtx-ios"),
            .product(name: "DeviceKit", package: "DeviceKit"),
            .product(name: "TalsecRuntime", package: "Free-RASP-iOS")
        ]
    )
]
```

### Security runtime dependencies

`VRTX` includes runtime integrity protection powered by Talsec freeRASP.
`VRTX.framework` links `TalsecRuntime` dynamically and exposes both
`TalsecRuntime` and `DeviceKit` in its public Swift interface, so both must be
resolvable in your project.

Because `VRTX` ships as an XCFramework, **Swift Package Manager cannot express
these dependencies transitively** — a binary target has no dependency list. The
SwiftPM snippet above therefore declares them explicitly, and you must keep the
pinned versions as shown: `DeviceKit` `5.7.0` and `Free-RASP-iOS` `6.14.5` are
the exact versions `VRTX` is compiled against, and a different version of either
is a build error rather than a soft incompatibility.

CocoaPods needs no such step — see below.

### CocoaPods

Add VRTX to your `Podfile`:

```ruby
platform :ios, '15.6'

target 'YourApp' do
  pod 'VRTX', '0.1.3'
end
```

Then run `pod install` and open the generated `.xcworkspace`.

`TalsecRuntime.xcframework` is bundled inside the pod and `DeviceKit` is
declared as a pod dependency, so both arrive automatically. freeRASP is
MIT-licensed and its notice ships in the pod as `TalsecRuntime-LICENSE.txt`.

> **Versions before 0.1.3 cannot be built with CocoaPods.** The pod declared no
> dependencies, so neither `DeviceKit` nor `TalsecRuntime` was available:
> compiling against `import VRTX` failed, and a build that got past that would
> fail at launch on the missing `TalsecRuntime.framework`. Use 0.1.3 or later,
> or integrate with SwiftPM.

## Quickstart

Call `Vrtx.setup` from the view controller that triggers the flow.
The SDK presents itself and reports back via the completion handler;
`started` is `true` once the flow is on screen.

```swift
import VRTX

Vrtx.setup(
    environment: .sandbox,
    clientID: "YOUR_CLIENT_ID",
    clientSecret: "YOUR_CLIENT_SECRET",
    mode: .light,
    language: .english,
    externalReference: "YOUR_EXTERNAL_REFERENCE",
    fontFamily: "Inter",
    onSuccess: { /* SDK UI launched */ },
    onError: { error in /* error.status, error.message */ }
)
```

## Contract

`Vrtx.setup` accepts these public configuration values:

| Parameter | Type | Values |
| --------- | ---- | ------ |
| `environment` | `Environment` | `.sandbox`, `.production` |
| `language` | `Language` | `.english`, `.arabic` |
| `mode` | `Mode` | `.light`, `.dark` |
| `externalReference` | `String` | Omit when no external reference is needed |

For appearance, pass `mode` and a `fontFamily` string matching a font family already embedded and registered in your app, such as `"Inter"`.

Pass `externalReference` as a string when your app needs to attach its own reference to the SDK session. Omit it when no external reference is needed.

## Support

For credentials, license keys, and integration help, contact your Vrtx
account manager or [support@vrtx.sa](mailto:contact@vrtx.sa).

## License

Licensed under the [Apache License, Version 2.0](LICENSE). Copyright © 2026 vrtx fintech.
