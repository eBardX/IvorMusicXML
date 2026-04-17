// swift-tools-version: 6.2

// © 2025–2026 John Gary Pusey (see LICENSE.md)

import PackageDescription

let package = Package(name: "IvorMusicXML",
                      platforms: [.iOS(.v18),
                                  .macOS(.v15)],
                      products: [.library(name: "IvorMusicXML",
                                          targets: ["IvorMusicXML"])],
                      dependencies: [.package(url: "https://github.com/swiftlang/swift-docc-plugin.git",
                                              .upToNextMajor(from: "1.1.0")),
                                     .package(url: "https://github.com/eBardX/XestiTools.git",
                                              .upToNextMajor(from: "7.2.0")),
                                     .package(url: "https://github.com/eBardX/XestiXML.git",
                                              .upToNextMajor(from: "4.0.0"))],
                      targets: [.target(name: "IvorMusicXML",
                                        dependencies: [.product(name: "XestiTools",
                                                                package: "XestiTools"),
                                                       .product(name: "XestiXML",
                                                                package: "XestiXML")]),
                                .testTarget(name: "IvorMusicXMLTests",
                                            dependencies: [.target(name: "IvorMusicXML")])],
                      swiftLanguageModes: [.v6])

let swiftSettings: [SwiftSetting] = [.defaultIsolation(nil),
                                     .enableUpcomingFeature("ExistentialAny"),
                                     .enableUpcomingFeature("ImmutableWeakCaptures"),
                                     .enableUpcomingFeature("InferIsolatedConformances"),
                                     .enableUpcomingFeature("InternalImportsByDefault"),
                                     .enableUpcomingFeature("MemberImportVisibility"),
                                     .enableUpcomingFeature("NonisolatedNonsendingByDefault")]

for target in package.targets {
    var settings = target.swiftSettings ?? []

    settings.append(contentsOf: swiftSettings)

    target.swiftSettings = settings
}
