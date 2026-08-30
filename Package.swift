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
            url: "https://github.com/vrtx-fintech/vrtx-ios/releases/download/0.1.8/VRTX.xcframework.zip",
            checksum: "655dd24b21bdca53a363f6ff0ef7140715b46340d784551e969c6b297e81f4e7"
        )
    ]
)
