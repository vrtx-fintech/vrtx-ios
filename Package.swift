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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.9/VRTX.xcframework.zip",
            checksum: "4a6c2b20d5cde7305a0e722c4dca36bd6dc79d7ce53eca01f5a3909e785b20a3"
        )
    ]
)
