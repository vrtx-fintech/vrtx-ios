// swift-tools-version:5.9
import PackageDescription

let vrtxURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.13/VRTX.xcframework.zip"
let vrtxChecksum = "8c8c353df43a9aca2a6fffc5ff7cc0bd3d8e2f11764dbabb993e0fb803beddf5"
let supportURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.13/VRTXSupport.xcframework.zip"
let supportChecksum = "ca933a1d120cfc9f947a1dae6121a457431fe1439cc1ba060a0507185fbe0d57"

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
