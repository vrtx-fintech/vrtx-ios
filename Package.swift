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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.0.2/VRTX.xcframework.zip",
            checksum: "2c38bb751bf6abe9c081fbb13ae5892c8cd5df93dba0950e3cbba6ebea9c9379"
        )
    ]
)
