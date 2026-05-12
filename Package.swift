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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.10/VRTX.xcframework.zip",
            checksum: "e5138f35dec9e33138a13fa6620cb89a038266b030f8284fdc4ad9b37e81cef7"
        )
    ]
)
