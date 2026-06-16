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
    .package(url: "https://github.com/vrtx-fintech/vrtx-ios", from: "0.0.16")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [.product(name: "VRTX", package: "vrtx-ios")]
    )
]
```

### CocoaPods

Add VRTX to your `Podfile`:

```ruby
platform :ios, '15.6'

target 'YourApp' do
  pod 'VRTX', '0.0.16'
end
```

Then run `pod install` and open the generated `.xcworkspace`.

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
| `environment` | `Environment` | `.sandbox`, `.staging` |
| `language` | `Language` | `.english`, `.arabic` |
| `mode` | `Mode` | `.light`, `.dark` |
| `externalReference` | `String` | Omit when no external reference is needed |

For appearance, pass `mode` and a `fontFamily` string matching a font family already embedded and registered in your app, such as `"Inter"`.

Pass `externalReference` as a string when your app needs to attach its own reference to the SDK session. Omit it when no external reference is needed.

## Support

For credentials, license keys, and integration help, contact your Vrtx
account manager or [support@vrtx.sa](mailto:support@vrtx.sa).

## License

Licensed under the [Apache License, Version 2.0](LICENSE). Copyright © 2026 vrtx fintech.
