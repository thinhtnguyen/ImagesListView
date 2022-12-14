// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ImagesListView",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ImagesListView",
            targets: ["ImagesListView"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ashleymills/Reachability.swift.git", from: "5.1.0"),
        .package(url: "https://github.com/Kitura/Swift-JWT.git", from: "3.6.201"),
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
//        .package(
//                    url: "https://github.com/onevcat/Kingfisher.git",
//                    from: "5.13.2"
//                ),
//            .package(
//                        url: "https://github.com/google/GoogleAppMeasurement.git",
//                        from: "9.3.0"
//                    ),
       
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ImagesListView",
            dependencies: []),
        .testTarget(
            name: "ImagesListViewTests",
            dependencies: ["ImagesListView"]),
    ]
)
