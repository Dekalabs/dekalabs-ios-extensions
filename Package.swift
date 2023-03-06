// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DekaExtensions",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "DekaStandardLibrary",
            targets: ["DekaStandardLibrary"]),
        .library(
            name: "DekaUIKit",
            targets: ["DekaUIKit"]),
        .library(
            name: "DekaFoundation",
            targets: ["DekaFoundation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.4.0")
    ],
    targets: [
        .target(
            name: "DekaStandardLibrary",
            dependencies: []),
        .target(
            name: "DekaUIKit",
            dependencies: ["Kingfisher"]),
        .target(
            name: "DekaFoundation",
            dependencies: []),
        .testTarget(
            name: "DekaStandardLibraryTests",
            dependencies: ["DekaStandardLibrary"]),
        .testTarget(
            name: "DekaUIKitTests",
            dependencies: ["DekaUIKit"]),
        .testTarget(
            name: "DekaFoundationTests",
            dependencies: ["DekaFoundation"],
            resources: [.copy("Resources/test_file.json")]),
    ]
)
