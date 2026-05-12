// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "VRTX",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "VRTX", targets: ["VRTX"])
    ],
    targets: [
        .binaryTarget(
            name: "VRTX",
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.11/VRTX.xcframework.zip",
            checksum: "56961170d7557f1f0083f9a75d070e2760f4db86637a77f0d81488e3a784a8a1"
        )
    ]
)
