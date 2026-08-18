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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.6/VRTX.xcframework.zip",
            checksum: "b2a85524a5f6239a985658623f7ca1ac09628b3d47dbbf184cab96779ced2e35"
        )
    ]
)
