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
            checksum: "8b4a09dc0378f29b1c53a796f571ea873afc7b2eb25619a06f5f11f2286b1eb4"
        )
    ]
)
