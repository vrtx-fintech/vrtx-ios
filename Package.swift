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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.4/VRTX.xcframework.zip",
            checksum: "dced667da8cea39d10892556d52aba4774597f45f6dbcc11e4cbb20215b999c1"
        )
    ]
)
