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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.6/VRTX.xcframework.zip",
            checksum: "e5a1ac4b21fb9dccf79026cc77b44aa6acf99312fd2521a74729518f03ef3016"
        )
    ]
)
