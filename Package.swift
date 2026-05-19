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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.14/VRTX.xcframework.zip",
            checksum: "55d283339d30c2938207aef2940e14b9006292870745955dfce380aa5d9e2211"
        )
    ]
)
