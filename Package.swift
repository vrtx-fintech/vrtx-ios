// swift-tools-version:5.9
import PackageDescription

let vrtxURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.14/VRTX.xcframework.zip"
let vrtxChecksum = "6f2da6edb3b004a4db697adcb114995173ffdd18e2d50ba88535c561126e0ea2"
let supportURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.14/VRTXSupport.xcframework.zip"
let supportChecksum = "fb526fae84088acb6284505be082cc124fc95e64e184a1833329ce14a9150efb"

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
