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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.3/VRTX.xcframework.zip",
            checksum: "1741321bfae19b858873d8b32f258b000a4e1ed9f88ad3ce2350a510c152fc15"
        )
    ]
)
