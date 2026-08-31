// swift-tools-version:5.9
import PackageDescription

let vrtxURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.11/VRTX.xcframework.zip"
let vrtxChecksum = "b0623613e019a10c73edc2814b50f1ba182e3afca0c947365a602b5523a831d6"
let supportURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.11/VRTXSupport.xcframework.zip"
let supportChecksum = "621e312ae182c1f550c0e00f964571d4ce85c72f58535fc44d18ecb2bd254f06"

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
