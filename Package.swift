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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.4/VRTX.xcframework.zip",
            checksum: "b2d4d222c9c6103fa15230c9fe498e956a2b56817b0a6035f745019d93cbfc37"
        )
    ]
)
