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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.16/VRTX.xcframework.zip",
            checksum: "07562345cfcac24c4ec13e21eeda2e8f13f59ebc146a28d2e39fd1017be34b30"
        )
    ]
)
