// swift-tools-version:5.9
import PackageDescription

let vrtxURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.15/VRTX.xcframework.zip"
let vrtxChecksum = "cf3a18372f902171ccb18179b2b11e6018cfbd9647ffec021ab88a85b791c001"
let supportURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.15/VRTXSupport.xcframework.zip"
let supportChecksum = "e5bf67339c82bf8d3fe76414b20f7b0258453d0f3e03cbda089d9583f03a168c"

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
