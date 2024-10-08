// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MobileCore",
    platforms: [
      .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MobileCore",
            targets: ["MobileCore"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
//        .package(
//          url: "https://github.com/apple/swift-collections.git",
//          .upToNextMinor(from: "1.1.0") // or `.upToNextMajor
//        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MobileCore",
            dependencies: [
//                .product(name: "Collections", package: "swift-collections")
            ]),
        .testTarget(
            name: "MobileCoreTests",
            dependencies: ["MobileCore"]),
    ]
)
