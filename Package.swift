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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.8/VRTX.xcframework.zip",
            checksum: "680aed4b35ab645b4963278cf5396cab6c17e90a11f4e1f867807989b57a7078"
        )
    ]
)
