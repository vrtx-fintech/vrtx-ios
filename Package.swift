// swift-tools-version:5.9
import PackageDescription

let vrtxURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.10/VRTX.xcframework.zip"
let vrtxChecksum = "4a40a753ea7688bf996545535d017b056a09d01b759bb678832bcca3dc6b01e9"
let supportURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.10/VRTXSupport.xcframework.zip"
let supportChecksum = "648cbaa5f43fc9565385f0d112f94fc38b63e87f3ef01f374d88a9015f7e24be"

let package = Package(
    name: "VRTX",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "VRTX", targets: ["VRTX", "VRTXSupport"]),
    ],
    targets: [
        .binaryTarget(
            name: "VRTX",
            url: vrtxURL,
            checksum: vrtxChecksum
        ),
        .binaryTarget(
            name: "VRTXSupport",
            url: supportURL,
            checksum: supportChecksum
        ),
    ]
)
