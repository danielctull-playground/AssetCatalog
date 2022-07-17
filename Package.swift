// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "AssetCatalog",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
    ],
    products: [
        .library(name: "AssetCatalog", targets: ["AssetCatalog"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.5.0"),
        .package(url: "https://github.com/danielctull-playground/FileBuilder", branch: "main"),
    ],
    targets: [

        .target(
            name: "AssetCatalog"),

        .testTarget(
            name: "AssetCatalogTests",
            dependencies: [
                "AssetCatalog"
            ],
            resources: [
                .copy("Resources")
            ]),

        // MARK: - Tool

        .executableTarget(
            name: "AssetCatalogTool",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "AssetCatalog",
                "FileBuilder",
            ]),

        // MARK: - Plugin

        .plugin(
            name: "GenerateAssetCatalog",
            capability: .buildTool(),
            dependencies: [
                "AssetCatalogTool",
            ]),

        .testTarget(
            name: "AssetCatalogPluginTests",
            resources: [
                .process("Resources")
            ],
            plugins: [
                "GenerateAssetCatalog",
            ]),
    ]
)
