// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SuperAppKit",
    platforms: [
        .iOS("11.4"),
    ],
    products: [
        .library(
            name: "SuperAppKitWrapper",
            type: .static,
            targets: ["SuperAppKitWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ZipArchive/ZipArchive", exact: Version(stringLiteral: "2.4.2")),
        .package(url: "https://github.com/mickeyl/SwiftYapDatabase", revision: "e1befb00a014fa75721633950e100dddd343f496"),
    ],
    targets: [
        .target(
            name: "APILayerWrapper",
            dependencies: [
                .target(name: "APILayer"),

                .target(name: "KulibinWrapper"),
                .target(name: "KulibinNetworkingWrapper"),
                .target(name: "KulibinPersistencyWrapper"),
                .target(name: "NestorWrapper"),
            ],
            resources: [
                .copy("Sources/Frameworks/APILayer.bundle"),
            ]
        ),
        .target(
            name: "BrowserBridgeWrapper",
            dependencies: [
                .target(name: "BrowserBridge"),

                .target(name: "APILayerWrapper"),
                .target(name: "KulibinWrapper"),
                .target(name: "KulibinNetworkingWrapper"),
                .target(name: "KulibinPersistencyWrapper"),
                .target(name: "NestorWrapper"),
                .target(name: "OrwellWrapper"),
                .target(name: "SusaninWrapper"),
                .target(name: "VKSVGImageWrapper"),
                .target(name: "ValetteKitWrapper"),
                .target(name: "WarholWrapper"),
                .target(name: "SAKLocalSharedWrapper"),
                .product(name: "ZipArchive", package: "ZipArchive"),
            ],
            resources: [
                .copy("Sources/Frameworks/BrowserBridge.bundle"),
            ]
        ),
        .target(
            name: "KulibinWrapper",
            dependencies: [
                .target(name: "Kulibin"),
            ],
            resources: [
                .copy("Sources/Frameworks/Kulibin.bundle"),
            ],
            linkerSettings: [
                .linkedLibrary("sqlite3"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv"),
                .linkedLibrary("compression"),
            ]
        ),

        .target(
            name: "KulibinNetworkingWrapper",
            dependencies: [
                .target(name: "KulibinNetworking"),

                .target(name: "KulibinWrapper"),
                .target(name: "KulibinPersistencyWrapper"),
                .target(name: "NestorWrapper"),
            ],
            resources: [
                .copy("Sources/Frameworks/KulibinNetworking.bundle"),
            ],
            linkerSettings: [
                .linkedFramework("Network"),
                .linkedFramework("CoreTelephony"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv"),
            ]
        ),
        .target(
            name: "KulibinPersistencyWrapper",
            dependencies: [
                .target(name: "KulibinPersistency"),

                .target(name: "KulibinWrapper"),
                .target(name: "NestorWrapper"),
                .product(name: "YapDatabase", package: "SwiftYapDatabase"),
            ],
            resources: [
                .copy("Sources/Frameworks/KulibinPersistency.bundle"),
            ],
            linkerSettings: [
                .linkedLibrary("sqlite3"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv"),
            ]
        ),
        .target(
            name: "MalevichWrapper",
            dependencies: [
                .target(name: "Malevich"),
            ],
            resources: [
                .copy("Sources/Frameworks/Malevich.bundle"),
            ],
            linkerSettings: [
                .linkedFramework("UIKit"),
            ]
        ),
        .target(
            name: "MilliganWrapper",
            dependencies: [
                .target(name: "Milligan"),
                .target(name: "KulibinWrapper"),
                .target(name: "NestorWrapper"),
            ],
            resources: [
                .copy("Sources/Frameworks/Milligan.bundle"),
            ]
        ),
        .target(
            name: "NestorWrapper",
            dependencies: [
                .target(name: "Nestor"),
            ],
            resources: [
                .copy("Sources/Frameworks/Nestor.bundle"),
            ],
            linkerSettings: [
                .linkedLibrary("c++"),
            ]
        ),
        .target(
            name: "OrwellWrapper",
            dependencies: [
                .target(name: "Orwell"),

                .target(name: "APILayerWrapper"),
                .target(name: "KulibinWrapper"),
                .target(name: "KulibinNetworkingWrapper"),
                .target(name: "KulibinPersistencyWrapper"),
                .target(name: "NestorWrapper"),
                .target(name: "ValetteKitWrapper"),
            ],
            resources: [
                .copy("Sources/Frameworks/Orwell.bundle"),
            ]
        ),
        .target(
            name: "SAKLocalSharedWrapper",
            dependencies: [
                .target(name: "SAKLocalShared"),

                .target(name: "KulibinWrapper"),
                .target(name: "ValetteKitWrapper"),
                .target(name: "WarholWrapper"),
                .target(name: "MalevichWrapper"),
            ],
            resources: [
                .copy("Sources/Frameworks/SAKLocalShared.bundle"),
            ]
        ),
        .target(
            name: "SusaninWrapper",
            dependencies: [
                .target(name: "Susanin"),
            ],
            resources: [
                .copy("Sources/Frameworks/Susanin.bundle"),
            ],
            linkerSettings: [
                .linkedFramework("UIKit"),
            ]
        ),
        .target(
            name: "ValetteKitWrapper",
            dependencies: [
                .target(name: "ValetteKit"),

                .target(name: "NestorWrapper"),
                .target(name: "MalevichWrapper"),
            ],
            resources: [
                .copy("Sources/Frameworks/ValetteKit.bundle"),
            ]
        ),
        .target(
            name: "VKAuthWrapper",
            dependencies: [
                .target(name: "VKAuth"),

                .target(name: "KulibinWrapper"),
                .target(name: "KulibinNetworkingWrapper"),
                .target(name: "NestorWrapper"),
                .target(name: "APILayerWrapper"),
                .target(name: "BrowserBridgeWrapper"),
                .target(name: "OrwellWrapper"),
                .target(name: "ValetteKitWrapper"),
                .target(name: "WarholWrapper"),
                .target(name: "MilliganWrapper"),
                .target(name: "VKAccessibilityIdentifierWrapper"),
            ],
            resources: [
                .copy("Sources/Frameworks/VKAuth.bundle"),
            ]
        ),
        .target(
            name: "VKSVGImageWrapper",
            dependencies: [
                .target(name: "VKSVGImage"),
            ],
            resources: [
                .copy("Sources/Frameworks/VKSVGImage.bundle"),
            ]
        ),
        .target(
            name: "WarholWrapper",
            dependencies: [
                .target(name: "Warhol"),

                .target(name: "KulibinWrapper"),
                .target(name: "KulibinNetworkingWrapper"),
                .target(name: "KulibinPersistencyWrapper"),
                .target(name: "NestorWrapper"),
            ],
            resources: [
                .copy("Sources/Frameworks/Kulibin.bundle"),
            ]
        ),
        .target(
            name: "VKAccessibilityIdentifierWrapper",
            dependencies: [
                .target(name: "VKAccessibilityIdentifier"),
            ],
            resources: [
                .copy("Sources/Frameworks/Warhol.bundle"),
            ]
        ),

        .target(
            name: "SuperAppKitWrapper",
            dependencies: [
                .target(name: "SuperAppKit"),

                .target(name: "APILayerWrapper"),
                .target(name: "BrowserBridgeWrapper"),
                .target(name: "KulibinWrapper"),
                .target(name: "KulibinNetworkingWrapper"),
                .target(name: "KulibinPersistencyWrapper"),
                .target(name: "MalevichWrapper"),
                .target(name: "MilliganWrapper"),

                .target(name: "NestorWrapper"),
                .target(name: "OrwellWrapper"),
                .target(name: "SAKLocalSharedWrapper"),
                .target(name: "SusaninWrapper"),
                .target(name: "ValetteKitWrapper"),
                .target(name: "VKAuthWrapper"),
                .target(name: "VKSVGImageWrapper"),
                .target(name: "WarholWrapper"),
                .target(name: "VKAccessibilityIdentifierWrapper"),
            ],
            resources: [
                .copy("Sources/Frameworks/SuperAppKit.bundle"),
            ],
            linkerSettings: [
                //                .unsafeFlags(["-ObjC", "-all_load"]),
            ]
        ),

        .binaryTarget(name: "Kulibin", path: "Sources/Frameworks/Kulibin.xcframework"),
        .binaryTarget(name: "SuperAppKit", path: "Sources/Frameworks/SuperAppKit.xcframework"),
        .binaryTarget(name: "APILayer", path: "Sources/Frameworks/APILayer.xcframework"),
        .binaryTarget(name: "BrowserBridge", path: "Sources/Frameworks/BrowserBridge.xcframework"),
        .binaryTarget(name: "KulibinNetworking", path: "Sources/Frameworks/KulibinNetworking.xcframework"),
        .binaryTarget(name: "KulibinPersistency", path: "Sources/Frameworks/KulibinPersistency.xcframework"),
        .binaryTarget(name: "Malevich", path: "Sources/Frameworks/Malevich.xcframework"),
        .binaryTarget(name: "Milligan", path: "Sources/Frameworks/Milligan.xcframework"),
        .binaryTarget(name: "Nestor", path: "Sources/Frameworks/Nestor.xcframework"),
        .binaryTarget(name: "Orwell", path: "Sources/Frameworks/Orwell.xcframework"),
        .binaryTarget(name: "SAKLocalShared", path: "Sources/Frameworks/SAKLocalShared.xcframework"),
        .binaryTarget(name: "Susanin", path: "Sources/Frameworks/Susanin.xcframework"),
        .binaryTarget(name: "ValetteKit", path: "Sources/Frameworks/ValetteKit.xcframework"),
        .binaryTarget(name: "VKAccessibilityIdentifier", path: "Sources/Frameworks/VKAccessibilityIdentifier.xcframework"),
        .binaryTarget(name: "VKAuth", path: "Sources/Frameworks/VKAuth.xcframework"),
        .binaryTarget(name: "VKSVGImage", path: "Sources/Frameworks/VKSVGImage.xcframework"),
        .binaryTarget(name: "Warhol", path: "Sources/Frameworks/Warhol.xcframework"),
    ]
)
