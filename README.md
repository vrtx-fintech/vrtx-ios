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
    .package(url: "https://github.com/vrtx-fintech/vrtx-ios", from: "0.0.12")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [.product(name: "VRTX", package: "vrtx-ios")]
    )
]
```

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
    fontFamily: "Inter", // omit to use the SDK default per language
    onSuccess: { /* SDK UI launched */ },
    onError: { error in /* error.status, error.message */ }
)
```

## Contract

`Vrtx.setup` accepts these public configuration enums:

| Parameter | Enum | Values |
| --------- | ---- | ------ |
| `environment` | `VrtxEnvironment` | `.sandbox`, `.staging` |
| `language` | `VrtxLanguage` | `.english`, `.arabic` |
| `mode` | `VrtxThemeMode` | `.light`, `.dark` |

For appearance, pass `mode` and a `fontFamily` string matching a font family already embedded and registered in your app, such as `"Inter"`.

## Support

For credentials, license keys, and integration help, contact your Vrtx
account manager or [support@vrtx.sa](mailto:support@vrtx.sa).

## License

Licensed under the [Apache License, Version 2.0](LICENSE). Copyright © 2026 vrtx fintech.
