// swift-tools-version:5.9
import PackageDescription

let vrtxURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.16/VRTX.xcframework.zip"
let vrtxChecksum = "53ed592720d3da4fd6f93a3dc6590b0074664b0f62725dc758e053860d39e7be"
let supportURL = "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.16/VRTXSupport.xcframework.zip"
let supportChecksum = "18e2701410b454fe0e0299a04ffeb810896ec97b338c4aa55ce1dd35af09bf9f"

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
