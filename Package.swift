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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.5/VRTX.xcframework.zip",
            checksum: "5e8a0bbd29adee7dceac141377d42b9672802a00ffb7486c23a80598d8cd24b1"
        )
    ]
)
