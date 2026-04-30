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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/sdk-1.1.0/VRTX.xcframework.zip",
            checksum: "3e665dbd1e7af61e50af72a159a9ce7ddf461d637ff4c0fc487ba35ed83900c8"
        )
    ]
)
