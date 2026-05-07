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
            checksum: "e92cb300128676b1994c2cc756cab215689756cc57b9edb1aab8bb5c1a7f1cd2"
        )
    ]
)
