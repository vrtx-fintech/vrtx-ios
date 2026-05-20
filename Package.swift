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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.15/VRTX.xcframework.zip",
            checksum: "961b5722a4a664b29050eda493374b9d444564aa36cff6a90a0dc3735887f88f"
        )
    ]
)
