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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.13/VRTX.xcframework.zip",
            checksum: "d3d7bb573353ef06952b43dfb58bcd84604f8f37df69f1437602f3240aa00a1f"
        )
    ]
)
