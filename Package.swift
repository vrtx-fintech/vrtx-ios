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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.3/VRTX.xcframework.zip",
            checksum: "18398b0ad01073025b9e8c6fd85a1226d34046aed9cc99c9bdf0be1bda8cb40a"
        )
    ]
)
