// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Oniguruma",
    products: [
        .library(name: "Oniguruma", type: .static, targets: ["Oniguruma"])
    ],
    targets: [
        .systemLibrary(name: "COniguruma", pkgConfig: "oniguruma", providers: [.brew(["oniguruma"])]),
        .target(name: "Oniguruma", dependencies: ["COniguruma"], path: "Sources/Oniguruma")
    ]
)
