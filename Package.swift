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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.2/VRTX.xcframework.zip",
            checksum: "d720602a5f87856b7fb234444f801367a7299501fd988525e560d4a2253d2eab"
        )
    ]
)
