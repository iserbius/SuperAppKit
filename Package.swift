// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "SuperAppKitSPM",
        platforms: [
            .iOS(.v12),
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
                        .copy("APILayer.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("APILayer"),
                        .linkedFramework("Kulibin"),
                        .linkedFramework("KulibinNetworking"),
                        .linkedFramework("KulibinPersistency"),
                        .linkedFramework("Nestor"),
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
                        .target(name: "SAKLocalSharedWrapper"),
                        .target(name: "SusaninWrapper"),
                        .target(name: "VKSVGImageWrapper"),
                        .target(name: "ValetteKitWrapper"),
                        .target(name: "WarholWrapper"),

                        .product(name: "ZipArchive", package: "ZipArchive"),
                    ],
                    resources: [
                        .copy("BrowserBridge.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("BrowserBridge"),

                        .linkedFramework("APILayer"),
                        .linkedFramework("Kulibin"),
                        .linkedFramework("KulibinNetworking"),
                        .linkedFramework("KulibinPersistency"),
                        .linkedFramework("Nestor"),
                        .linkedFramework("Orwell"),
                        .linkedFramework("SAKLocalShared"),
                        .linkedFramework("Susanin"),
                        .linkedFramework("VKSVGImage"),
                        .linkedFramework("ValetteKit"),
                        .linkedFramework("Warhol"),
                    ]
            ),
            .target(
                    name: "KulibinWrapper",
                    dependencies: [
                        .target(name: "Kulibin"),
                    ],
                    resources: [
                        .copy("Kulibin.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("Kulibin"),
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
                        .copy("KulibinNetworking.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("KulibinNetworking"),
                        .linkedFramework("Kulibin"),
                        .linkedFramework("KulibinPersistency"),
                        .linkedFramework("Nestor"),
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
                        .copy("KulibinPersistency.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("KulibinPersistency"),
                        .linkedFramework("Kulibin"),
                        .linkedFramework("Nestor"),

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
                        .copy("Malevich.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("Malevich"),
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
                        .copy("Milligan.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("Milligan"),
                        .linkedFramework("Kulibin"),
                        .linkedFramework("Nestor"),
                    ]
            ),
            .target(
                    name: "NestorWrapper",
                    dependencies: [
                        .target(name: "Nestor"),
                    ],
                    resources: [
                        .copy("Nestor.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("Nestor"),
                        .linkedLibrary("c++"),
                    ]
            ),
            .target(
                    name: "OrwellWrapper",
                    dependencies: [
                        .target(name: "APILayerWrapper"),
                        .target(name: "KulibinWrapper"),
                        .target(name: "KulibinNetworkingWrapper"),
                        .target(name: "KulibinPersistencyWrapper"),
                        .target(name: "NestorWrapper"),
                        .target(name: "ValetteKitWrapper"),
                        .target(name: "Orwell"),
                    ],
                    resources: [
                        .copy("Orwell.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("Orwell"),

                        .linkedFramework("APILayer"),
                        .linkedFramework("Kulibin"),
                        .linkedFramework("KulibinNetworking"),
                        .linkedFramework("KulibinPersistency"),
                        .linkedFramework("Nestor"),
                        .linkedFramework("ValetteKit"),
                    ]
            ),
            .target(
                    name: "SAKLocalSharedWrapper",
                    dependencies: [
                        .target(name: "KulibinWrapper"),
                        .target(name: "MalevichWrapper"),
                        .target(name: "ValetteKitWrapper"),
                        .target(name: "WarholWrapper"),
                        .target(name: "SAKLocalShared"),
                    ],
                    resources: [
                        .copy("SAKLocalShared.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("SAKLocalShared"),
                        .linkedFramework("Kulibin"),
                        .linkedFramework("Malevich"),
                        .linkedFramework("ValetteKit"),
                        .linkedFramework("Warhol"),
                    ]
            ),
            .target(
                    name: "SusaninWrapper",
                    dependencies: [
                        .target(name: "Susanin"),
                    ],
                    resources: [
                        .copy("Susanin.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("Susanin"),
                        .linkedFramework("UIKit"),
                    ]
            ),
            .target(
                    name: "ValetteKitWrapper",
                    dependencies: [
                        .target(name: "ValetteKit"),

                        .target(name: "MalevichWrapper"),
                        .target(name: "NestorWrapper"),
                    ],
                    resources: [
                        .copy("ValetteKit.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("ValetteKit"),

                        .linkedFramework("Malevich"),
                        .linkedFramework("Nestor"),
                    ]
            ),
            .target(
                    name: "VKAuthWrapper",
                    dependencies: [
                        .target(name: "APILayerWrapper"),
                        .target(name: "BrowserBridgeWrapper"),
                        .target(name: "KulibinWrapper"),
                        .target(name: "KulibinNetworkingWrapper"),
                        .target(name: "MilliganWrapper"),
                        .target(name: "NestorWrapper"),
                        .target(name: "OrwellWrapper"),
                        .target(name: "ValetteKitWrapper"),

                        .target(name: "VKAuth"),

                        .target(name: "WarholWrapper"),
                        .target(name: "VKAccessibilityIdentifierWrapper"),
                    ],
                    resources: [
                        .copy("VKAuth.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .unsafeFlags([
//                            "-Objc", "-all-load", "-Xfrontend", "-module-interface-preserve-types-as-written",
//                        ]),
//                        .linkedFramework("VKAuth"),
                        .linkedFramework("APILayer"),
                        .linkedFramework("BrowserBridge"),
                        .linkedFramework("Kulibin"),
                        .linkedFramework("KulibinNetworking"),
                        .linkedFramework("Milligan"),
                        .linkedFramework("Nestor"),
                        .linkedFramework("Orwell"),
                        .linkedFramework("ValetteKit"),
                        .linkedFramework("Warhol"),
                        .linkedFramework("VKAccessibilityIdentifier"),
                    ]
            ),
            .target(
                    name: "VKSVGImageWrapper",
                    dependencies: [
                    ],
                    resources: [
                        .copy("VKSVGImage.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
                        .linkedFramework("VKSVGImage"),
                    ]
            ),
            .target(
                    name: "WarholWrapper",
                    dependencies: [
                        .target(name: "KulibinWrapper"),
                        .target(name: "KulibinNetworkingWrapper"),
                        .target(name: "KulibinPersistencyWrapper"),
                        .target(name: "NestorWrapper"),
                        .target(name: "Warhol"),
                    ],
                    resources: [
                        .copy("Warhol.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("Warhol"),

                        .linkedFramework("Kulibin"),
                        .linkedFramework("KulibinNetworking"),
                        .linkedFramework("KulibinPersistency"),
                        .linkedFramework("Nestor"),
                    ]
            ),
            .target(
                    name: "VKAccessibilityIdentifierWrapper",
                    dependencies: [
                    ],
                    resources: [
                        .copy("VKAccessibilityIdentifier.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
                        .linkedFramework("VKAccessibilityIdentifier"),
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
                        .target(name: "VKAccessibilityIdentifierWrapper"),
                        .target(name: "VKAuthWrapper"),
                        .target(name: "VKSVGImageWrapper"),
                        .target(name: "WarholWrapper"),
//                        .product(name: "ZipArchive", package: "ZipArchive"),
//                        .product(name: "YapDatabase", package: "SwiftYapDatabase"),
                    ],
                    resources: [
                        .copy("SuperAppKit.bundle"),
                    ],
//                    publicHeadersPath: "Sources/Frameworks",
//                    cSettings: [
//                         .headerSearchPath("Sources/Frameworks")
//                    ],
                    linkerSettings: [
//                        .linkedFramework("SuperAppKit"),

                        .linkedFramework("APILayer"),
                        .linkedFramework("BrowserBridge"),
                        .linkedFramework("Kulibin"),
                        .linkedFramework("KulibinNetworking"),
                        .linkedFramework("KulibinPersistency"),
                        .linkedFramework("Malevich"),
                        .linkedFramework("Milligan"),
                        .linkedFramework("Nestor"),
                        .linkedFramework("Orwell"),
                        .linkedFramework("SAKLocalShared"),
                        .linkedFramework("Susanin"),
                        .linkedFramework("ValetteKit"),
                        .linkedFramework("VKAccessibilityIdentifier"),
                        .linkedFramework("VKAuth"),
                        .linkedFramework("VKSVGImage"),
                        .linkedFramework("Warhol"),

//                        .linkedLibrary("sqlite3"),
//                        .linkedLibrary("c++"),
//                        .linkedLibrary("resolv"),
//                        .linkedLibrary("compression"),
//                        .linkedFramework("Network"),
//                        .linkedFramework("CoreTelephony"),
//                        .linkedFramework("UIKit"),
                    ]
            ),

            .binaryTarget(
                    name: "Kulibin",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/Kulibin.xcframework.zip",
                    checksum: "008feacaad3b912ab23a2a268a695256e9ebbf4e1caec4de15d9c26aa542b797"
            ),
            .binaryTarget(
                    name: "SuperAppKit",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/SuperAppKit.xcframework.zip",
                    checksum: "9bba49bf3ca7068d819cd6dfdfe2d8e37f7e71dabe5cf241ee5ee40aa5247919"
            ),
            .binaryTarget(
                    name: "APILayer",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/APILayer.xcframework.zip",
                    checksum: "e9f4bb0ab073f4cf293ca6e796e4ce962f690de6fdccdfd68e010d77a491f29b"
            ),
            .binaryTarget(
                    name: "BrowserBridge",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/BrowserBridge.xcframework.zip",
                    checksum: "d8b2a49b0009d6a9576fa707121931d012a7eeffc5b0549ec550eb1939a7dc62"
            ),
            .binaryTarget(
                    name: "KulibinNetworking",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/KulibinNetworking.xcframework.zip",
                    checksum: "2bcfacdc8d465900119ea0db3f8beccfb8feea7b58930ab9e1577ada818de014"
            ),
            .binaryTarget(
                    name: "KulibinPersistency",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/KulibinPersistency.xcframework.zip",
                    checksum: "8862789eaec10bc043c5c35b765712ea53e643cc9b4c6fa21de68158d2ca503f"
            ),
            .binaryTarget(
                    name: "Malevich",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/Malevich.xcframework.zip",
                    checksum: "4fcdc23ba809463fec19cfd852c975064d21f7a07b7926170f0490641b136fec"
            ),
            .binaryTarget(
                    name: "Milligan",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/Milligan.xcframework.zip",
                    checksum: "f4b7be62e9acef405a833667cb496adf4021c78895e229ceed60d236207b50ce"
            ),
            .binaryTarget(
                    name: "Nestor",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/Nestor.xcframework.zip",
                    checksum: "e16a43f8b90786bf4c12dcdbca538b74c25dfe4880a70df4e0df27d9f369638f"
            ),
            .binaryTarget(
                    name: "Orwell",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/Orwell.xcframework.zip",
                    checksum: "3af6574f6140f37db7f471fa20ac94364e6ac785b4dc768ca2a565e58a63be60"
            ),
            .binaryTarget(
                    name: "SAKLocalShared",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/SAKLocalShared.xcframework.zip",
                    checksum: "a52f326f257c70554ff0ce78630463293879578b49b735eabbc4e8ddae63d1ed"
            ),
            .binaryTarget(
                    name: "Susanin",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/Susanin.xcframework.zip",
                    checksum: "ae140c71d245d58d3fbc86520bc6912fe2aabed620d30089058f4c238e03e309"
            ),
            .binaryTarget(
                    name: "ValetteKit",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/ValetteKit.xcframework.zip",
                    checksum: "14009d0e32312e9eba825fea8b78317f49074c1e802f3a8dae59c23ca212ee38"
            ),
            .binaryTarget(
                    name: "VKAccessibilityIdentifier",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/VKAccessibilityIdentifier.xcframework.zip",
                    checksum: "59afa50ba4e829c3d9f6d31764425bec237f6e162a16a0bb68deb2747474efc7"
            ),
            .binaryTarget(
                    name: "VKAuth",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/VKAuth.xcframework.zip",
                    checksum: "8a0a165646e33a4499be9730151f182123c798936b7e213288645ec586a75018"
            ),
            .binaryTarget(
                    name: "VKSVGImage",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/VKSVGImage.xcframework.zip",
                    checksum: "0ab892eed3c2574e3a15ea110473dd47f72459ddc5d4ca83daf49f205a75b57c"
            ),
            .binaryTarget(
                    name: "Warhol",
                    url: "https://github.com/iserbius/SuperAppKit/raw/0a38113a781c9ad612f88f28ba87f02a7424fed4/Sources/Frameworks/Warhol.xcframework.zip",
                    checksum: "44213b83b1d3d6ec42b9a8d475f4ed1273d20b89f5982a4b7be210bf6a8f5953"
            ),
        ]
)
