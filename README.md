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
    .package(url: "https://github.com/vrtx-fintech/vrtx-ios", from: "0.1.13"),
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
  pod 'VRTX', '0.1.13'
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
customThemeOptions.cardImage = .remote(URL(string: "https://example.com/card.png")!)
customThemeOptions.brandLogo = .remote(URL(string: "https://example.com/logo.png")!)
customThemeOptions.brandName = "Atlas Pay"
customThemeOptions.colors = VrtxColors(
    allBrands: .init(primary: "#377DFF", buttonLabel: "#FFFFFF"),
    labels: .init(
        primary: "#12233D", secondary: "#60708A",
        tertiary: "#8B9AB2", quaternary: "#B8C4D6"
    ),
    fills: .init(
        primary: "#EAF3FF", secondary: "#DCEAFF",
        tertiary: "#C5D9F5", quaternary: "#ADC8EC",
        vibrant: .init(secondary: "#4DE3D1")
    ),
    backgrounds: .init(
        primary: "#F4F8FF", secondary: "#F7FAFF", tertiary: "#E7F5F6",
        primaryElevated: "#FFFFFF", secondaryElevated: "#F1F6FC",
        tertiaryElevated: "#E6EEF8"
    ),
    backgroundsGradient: .init(wb01: "#EAF3FF", wb02: "#E7F5F6"),
    accents: .init(
        red: "#E05252", redBg: "#FFE7E7", green: "#2E9B67",
        greenBg: "#E1F5EA", orange: "#E58A2B", indigo: "#5B5BD6",
        teal: "#4DE3D1", pink: "#D65B9B", cyan: "#2DAAC7", purple: "#8A5BD6"
    )
)
customThemeOptions.spacing = VrtxSpacing(
    x0: 0, xxs: 2, xs: 4, sm: 8, md: 12,
    ml: 16, lg: 20, xl: 24, xxl: 32, xxxl: 40
)
customThemeOptions.radius = VrtxRadius(
    x0: 0, xxs: 2, xs: 4, s: 6, sm: 8, md: 12,
    ml: 16, lg: 20, xl: 24, xxl: 28, xxxl: 32,
    big: 40, full: 999, huge: 64
)
customThemeOptions.sizing = VrtxSizing(
    xxs: 2, xs: 4, sm: 8, md: 16,
    lg: 24, xl: 32, xxl: 48, xxxl: 64
)

Vrtx.setup(
    environment: .sandbox,
    clientID: "YOUR_CLIENT_ID",
    clientSecret: "YOUR_CLIENT_SECRET",
    mode: .light,
    language: .english,
    externalReference: "YOUR_EXTERNAL_REFERENCE",
    fontFamily: "Inter",
    homeDesignOption: .optionC,
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
| `homeDesignOption` | `VrtxHomeDesignOption` | `.optionA`, `.optionB`, `.optionC` |

### `ThemeOptions` reference

| Parameter | Type | Values |
| --------- | ---- | ------ |
| `brandName` | `String?` | `"Atlas Pay"` |
| `cardImage` | `VrtxImageSource?` | `.image(UIImage(...))` or `.remote(URL(...))` |
| `brandLogo` | `VrtxImageSource?` | `.image(UIImage(...))` or `.remote(URL(...))` |
| `colors` | `VrtxColors?` | `allBrands`, `labels`, `fills`, `backgrounds`, `backgroundsGradient`, `accents` |
| `spacing` | `VrtxSpacing?` | `x0`, `xxs`, `xs`, `sm`, `md`, `ml`, `lg`, `xl`, `xxl`, `xxxl` |
| `radius` | `VrtxRadius?` | `x0`, `xxs`, `xs`, `s`, `sm`, `md`, `ml`, `lg`, `xl`, `xxl`, `xxxl`, `big`, `full`, `huge` |
| `sizing` | `VrtxSizing?` | `xxs`, `xs`, `sm`, `md`, `lg`, `xl`, `xxl`, `xxxl` |

`VrtxColors` contains these nested keys:

| Group | Type | Keys |
| ----- | ---- | ---- |
| `colors.allBrands` | `VrtxColors.AllBrands` | `primary`, `buttonLabel` |
| `colors.labels` | `VrtxColors.Labels` | `primary`, `secondary`, `tertiary`, `quaternary` |
| `colors.fills` | `VrtxColors.Fills` | `primary`, `secondary`, `tertiary`, `quaternary`, `vibrant.secondary` |
| `colors.backgrounds` | `VrtxColors.Backgrounds` | `primary`, `secondary`, `tertiary`, `primaryElevated`, `secondaryElevated`, `tertiaryElevated` |
| `colors.backgroundsGradient` | `VrtxColors.BackgroundsGradient` | `wb01`, `wb02` |
| `colors.accents` | `VrtxColors.Accents` | `red`, `redBg`, `green`, `greenBg`, `orange`, `indigo`, `teal`, `pink`, `cyan`, `purple` |

Color values use `#RRGGBB` or `rgba(r,g,b,a)` strings. URLs from a theme
configuration map to `.remote(URL(...))` on iOS.

For appearance, pass `mode` and a `fontFamily` string matching a font family already embedded and registered in your app, such as `"Inter"`.

Pass `externalReference` as a string when your app needs to attach its own reference to the SDK session. Omit it when no external reference is needed.

## Support

For credentials, license keys, and integration help, contact your Vrtx
account manager or [contact@vrtx.sa](mailto:contact@vrtx.sa).

## License

Licensed under the [Apache License, Version 2.0](LICENSE). Copyright © 2026 vrtx fintech.
