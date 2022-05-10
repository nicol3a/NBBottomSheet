// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "NBBottomSheet",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "NBBottomSheet",
            targets: ["NBBottomSheet"]
        )
    ],
    targets: [
        .target(
            name: "NBBottomSheet",
            path: "NBBottomSheet/NBBottomSheet/Sources"
        )
    ]
)
