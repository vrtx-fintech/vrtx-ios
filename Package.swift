// swift-tools-version:5.9
import PackageDescription

let vrtxURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.17/VRTX.xcframework.zip"
let vrtxChecksum = "6f6812a8f6b0f9ff6fdbf1fe4ff31f2911bb8f4d3ae4901990dc504431274bdc"
let supportURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.17/VRTXSupport.xcframework.zip"
let supportChecksum = "0ce1ce85f9685eca237c2d6a3a0975606182f4b5d93f2109602c6642857a9cd2"

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
