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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/sdk-0.0.6/VRTX.xcframework.zip",
            checksum: "6d0db317e77eb642264fff36526dd380d9272e8ad16afd335b4e5b91570a8df2"
        )
    ]
)
