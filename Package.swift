// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ANSIColor",
    products: [
        .library(
            name: "ANSIColor",
            targets: ["ANSIColor"]),
    ],
    targets: [
        .target(
            name: "ANSIColor"),
        .testTarget(
            name: "ANSIColorTests",
            dependencies: ["ANSIColor"]
        ),
    ]
)
