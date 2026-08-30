// swift-tools-version:5.9
import PackageDescription

let vrtxURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.9/VRTX.xcframework.zip"
let vrtxChecksum = "fb6340773ce603ce28511b4d2947f07ced01c8d6aa022300fda916e1ede9a9ef"
let supportURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.9/VRTXSupport.xcframework.zip"
let supportChecksum = "e64bf663e51de72a69177eb45d5e9c7ec4744e41fd4e3f15d8cdd701b349826f"

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
