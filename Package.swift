// swift-tools-version: 6.3

// © 2025–2026 John Gary Pusey (see LICENSE.md)

import PackageDescription

let swiftSettings: [SwiftSetting] = [.defaultIsolation(nil),
                                     .enableUpcomingFeature("ExistentialAny"),
                                     .enableUpcomingFeature("ImmutableWeakCaptures"),
                                     .enableUpcomingFeature("InferIsolatedConformances"),
                                     .enableUpcomingFeature("InternalImportsByDefault"),
                                     .enableUpcomingFeature("MemberImportVisibility"),
                                     .enableUpcomingFeature("NonisolatedNonsendingByDefault")]

let package = Package(name: "IvorMusicXML",
                      platforms: [.iOS(.v18),
                                  .macOS(.v15)],
                      products: [.library(name: "IvorMusicXML",
                                          targets: ["IvorMusicXML"])],
                      dependencies: [.package(url: "https://github.com/eBardX/XestiArchive.git",
                                              .upToNextMajor(from: "1.1.0")),
                                     .package(url: "https://github.com/eBardX/XestiTools.git",
                                              .upToNextMajor(from: "9.1.0")),
                                     .package(url: "https://github.com/eBardX/XestiXML.git",
                                              .upToNextMajor(from: "5.0.0"))],
                      targets: [.target(name: "IvorMusicXML",
                                        dependencies: [.product(name: "XestiArchive",
                                                                package: "XestiArchive"),
                                                       .product(name: "XestiTools",
                                                                package: "XestiTools"),
                                                       .product(name: "XestiXML",
                                                                package: "XestiXML")],
                                        swiftSettings: swiftSettings),
                                .testTarget(name: "IvorMusicXMLTests",
                                            dependencies: [.target(name: "IvorMusicXML")],
                                            resources: [.copy("Fixtures")],
                                            swiftSettings: swiftSettings)],
                      swiftLanguageModes: [.v6])
