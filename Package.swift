// swift-tools-version:5.3

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
    targets: [

        .target(name: "AssetCatalog"),

        .testTarget(
            name: "AssetCatalogTests",
            dependencies: [
                "AssetCatalog"
            ],
            resources: [
                .copy("Resources")
            ]),
    ]
)
