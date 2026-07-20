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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.1/VRTX.xcframework.zip",
            checksum: "b02501b69b58bde463172e6759b42be2f9900f37c33b49b142923dbf448eeb10"
        )
    ]
)
