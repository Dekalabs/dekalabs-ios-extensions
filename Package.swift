// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DekaExtensions",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DekaStandardLibrary",
            targets: ["StandardLibrary"]),
        .library(
            name: "DekaUIKit",
            targets: ["DekaUIKit"]),
        .library(
            name: "DekaFoundation",
            targets: ["DekaFoundation"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "5.15.7")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "StandardLibrary",
            dependencies: []),
        .target(
            name: "DekaUIKit",
            dependencies: ["Kingfisher"]),
        .target(
            name: "DekaFoundation",
            dependencies: []),
        .testTarget(
            name: "StandardLibraryTests",
            dependencies: ["StandardLibrary"]),
        .testTarget(
            name: "DekaUIKitTests",
            dependencies: ["DekaUIKit"]),
        .testTarget(
            name: "DekaFoundationTests",
            dependencies: ["DekaFoundation"]),
    ]
)
