// swift-tools-version:5.9
import PackageDescription

let vrtxURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.12/VRTX.xcframework.zip"
let vrtxChecksum = "3485444423317b2aec937ccfb62296e5e69f7aed8a4521230d9f241bad301e4e"
let supportURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.12/VRTXSupport.xcframework.zip"
let supportChecksum = "271bcca8b7652777944d2dac1a66bd91cd28e892123da117f4f28d4a971ad3ba"

let package = Package(
    name: "VRTX",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "VRTX", targets: ["VRTX", "VRTXSupport"]),
    ],
    targets: [
        .binaryTarget(
            name: "VRTX",
            url: vrtxURL,
            checksum: vrtxChecksum
        ),
        .binaryTarget(
            name: "VRTXSupport",
            url: supportURL,
            checksum: supportChecksum
        ),
    ]
)
