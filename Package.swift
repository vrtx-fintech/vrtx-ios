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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.0/VRTX.xcframework.zip",
            checksum: "d1de56050f19a9338b43caf355a10d431108ebe61d38f21c78eca601958df112"
        )
    ]
)
