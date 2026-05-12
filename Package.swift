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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.12/VRTX.xcframework.zip",
            checksum: "7e49daae7e20f39b92781722be3483191ee7888a48905f2334fe520153ff8053"
        )
    ]
)
