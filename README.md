# vrtx-ios

The official iOS SDK for Vrtx — onboarding, wallet, and card flows for your app.

## Requirements

| Tooling | Minimum |
| ---------------- | ------- |
| iOS | 15.6 |
| Xcode | 16 |
| Swift | 5.9 |

## Installation

### Xcode

1. **File → Add Package Dependencies…**
2. Paste the repository URL: `https://github.com/vrtx-fintech/vrtx-ios`
3. Choose a version rule (we recommend **Up to Next Major** from the latest release) and add the `VRTX` library to your target.

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/vrtx-fintech/vrtx-ios", from: "0.1.10"),
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
  pod 'VRTX', '0.1.10'
end
```

Then run `pod install` and open the generated `.xcworkspace`.

`TalsecRuntime.xcframework` is bundled inside the pod and `DeviceKit` is
declared as a pod dependency, so both arrive automatically. freeRASP is
MIT-licensed and its notice ships in the pod as `TalsecRuntime-LICENSE.txt`.

> **CocoaPods requires 0.1.4 or later.** Earlier pod versions declared no
> dependencies, so neither `DeviceKit` nor `TalsecRuntime` was available:
> compiling against `import VRTX` failed, and a build that got past that would
> fail at launch on the missing `TalsecRuntime.framework`. 0.1.3 was never
> published to CocoaPods at all — it exists only for Swift Package Manager.

## Quickstart

Call `Vrtx.setup` from the view controller that triggers the flow.
The SDK presents itself and reports back via the completion handler;
`started` is `true` once the flow is on screen.

```swift
import Foundation
import VRTX

let customThemeOptions = ThemeOptions()
customThemeOptions.primaryColor = "#0A5CFF"
customThemeOptions.buttonTextColor = "#FFFFFF"
customThemeOptions.backgroundColor = "#F7F9FC"
customThemeOptions.secondaryBackgroundColor = "#FFFFFF"
customThemeOptions.textColor = "#101828"
customThemeOptions.secondaryTextColor = "#475467"
customThemeOptions.tertiaryTextColor = "#667085"
customThemeOptions.quaternaryTextColor = "#98A2B3"
customThemeOptions.fieldBackground = "#FFFFFF"
customThemeOptions.textFieldBackgroundColor = "#FFFFFF"
customThemeOptions.textFieldOutlineColor = "#D0D5DD"
customThemeOptions.secondaryButtonColor = "#EAF1FF"
customThemeOptions.creditArrowColor = "#12B76A"
customThemeOptions.creditBackgroundColor = "#ECFDF3"
customThemeOptions.errorColor = "#D92D20"
customThemeOptions.errorBackgroundColor = "rgba(217,45,32,0.10)"
customThemeOptions.cardGradientStart = "#0A5CFF"
customThemeOptions.cardGradientEnd = "#0044CC"
customThemeOptions.fontFamilyEnglish = "Arial"
customThemeOptions.fontFamilyArabic = "Arial"
customThemeOptions.bodyFontSize = 16
customThemeOptions.textSizes = [
    "l": 32, "t_1": 28, "t_2": 22, "t_3": 20,
    "h": 17, "body": 16, "cta": 15, "subheading": 14,
    "footnote": 13, "cap_1": 12, "cap_2": 11,
]
customThemeOptions.cardCornerRadius = 16
customThemeOptions.buttonCornerRadius = 24
customThemeOptions.spacing = ["xs": 4, "sm": 8, "md": 16, "lg": 24, "xl": 32]
customThemeOptions.sizing = ["buttonHeight": 56, "fieldHeight": 56, "cardHeight": 220]
customThemeOptions.layout = .optionC
customThemeOptions.cardImage = .remote(URL(string: "https://example.com/card.png")!)
customThemeOptions.brandLogo = .remote(URL(string: "https://example.com/logo.png")!)

Vrtx.setup(
    environment: .sandbox,
    clientID: "YOUR_CLIENT_ID",
    clientSecret: "YOUR_CLIENT_SECRET",
    mode: .light,
    language: .english,
    externalReference: "YOUR_EXTERNAL_REFERENCE",
    fontFamily: "Inter",
    theme: customThemeOptions,
    onSuccess: { /* SDK UI launched */ },
    onError: { error in /* error.status, error.message */ },
    onExit: { /* SDK UI dismissed */ }
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

### `ThemeOptions` reference

| Parameter | Type | Values |
| --------- | ---- | ------ |
| `primaryColor` | `String?` | `"#0A5CFF"` or `"rgba(10,92,255,1)"` |
| `buttonTextColor` | `String?` | `"#FFFFFF"` |
| `backgroundColor` | `String?` | `"#F7F9FC"` |
| `secondaryBackgroundColor` | `String?` | `"#FFFFFF"` |
| `textColor` | `String?` | `"#101828"` |
| `secondaryTextColor` | `String?` | `"#475467"` |
| `tertiaryTextColor` | `String?` | `"#667085"` |
| `quaternaryTextColor` | `String?` | `"#98A2B3"` |
| `fieldBackground` | `String?` | `"#FFFFFF"` |
| `textFieldBackgroundColor` | `String?` | `"#FFFFFF"` |
| `textFieldOutlineColor` | `String?` | `"#D0D5DD"` |
| `secondaryButtonColor` | `String?` | `"#EAF1FF"` |
| `creditArrowColor` | `String?` | `"#12B76A"` |
| `creditBackgroundColor` | `String?` | `"#ECFDF3"` |
| `errorColor` | `String?` | `"#D92D20"` |
| `errorBackgroundColor` | `String?` | `"rgba(217,45,32,0.10)"` |
| `cardGradientStart` | `String?` | `"#0A5CFF"` |
| `cardGradientEnd` | `String?` | `"#0044CC"` |
| `fontFamilyEnglish` | `String?` | Registered family, e.g. `"Arial"` |
| `fontFamilyArabic` | `String?` | Registered family, e.g. `"Arial"` |
| `bodyFontSize` | `CGFloat?` | `16` |
| `textSizes` | `[String: CGFloat]?` | `{"body": 16, "cta": 15}` |
| `cardCornerRadius` | `CGFloat?` | `16` |
| `buttonCornerRadius` | `CGFloat?` | `24` |
| `spacing` | `[String: CGFloat]?` | `{"sm": 8, "md": 16}` |
| `sizing` | `[String: CGFloat]?` | `{"buttonHeight": 56}` |
| `layout` | `VrtxHomeDesignOption?` | `.optionA`, `.optionB`, `.optionC` |
| `cardImage` | `VrtxImageSource?` | `.image(UIImage(...))` or `.remote(URL(...))` |
| `brandLogo` | `VrtxImageSource?` | `.image(UIImage(...))` or `.remote(URL(...))` |

Color values use `#RRGGBB` or `rgba(r,g,b,a)` strings. iOS `ThemeOptions`
does not expose an Android-style `brandName` property.

For appearance, pass `mode` and a `fontFamily` string matching a font family already embedded and registered in your app, such as `"Inter"`.

Pass `externalReference` as a string when your app needs to attach its own reference to the SDK session. Omit it when no external reference is needed.

## Support

For credentials, license keys, and integration help, contact your Vrtx
account manager or [contact@vrtx.sa](mailto:contact@vrtx.sa).

## License

Licensed under the [Apache License, Version 2.0](LICENSE). Copyright © 2026 vrtx fintech.
