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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.6/VRTX.xcframework.zip",
            checksum: "9d928780f0157ecb03221fb1d045ec61e19d3489e7efcf70ef9dad5a502f6a8d"
        )
    ]
)
