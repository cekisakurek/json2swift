// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "json2swift",
    products: [
            // If we want to distribute a Swift package as both a
            // library and a command line tool, one way to do that
            // is to simply use lower case characters for the CLI.
            .library(name: "json2swift", targets: ["json2swift"]),
            .executable(name: "cli", targets: ["json2swiftcli"])
        ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        
    ],
    targets: [
        .target(
            name: "json2swift",
            dependencies: [],
            path: "json2swift"
        ),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "json2swiftcli",
            dependencies: ["json2swift"],
            path: "cli"),
        .testTarget(
            name: "json2swiftTests",
            dependencies: ["json2swift"],
            path: "unit_tests"),
    ]
)
