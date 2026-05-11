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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.7/VRTX.xcframework.zip",
            checksum: "aa3ebbbd1a6199de16b1db6855ca8c21d1c88069316f223786ad38f23f5307d4"
        )
    ]
)
