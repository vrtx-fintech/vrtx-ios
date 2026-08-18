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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.7/VRTX.xcframework.zip",
            checksum: "cfc8d67ddd25208060ae654e60dfecf60e73123866aa8d0baf7049e00911491a"
        )
    ]
)
