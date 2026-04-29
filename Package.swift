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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.5/VRTX.xcframework.zip",
            checksum: "656a9b819d64f994be19aa09b2d12013be2729efbf698d1b3a390492aee2b0d6"
        )
    ]
)
