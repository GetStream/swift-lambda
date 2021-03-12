// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "Lambda",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
        .executable(name: "Lambda", targets: ["Lambda"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/swift-aws-lambda-runtime.git", from: "0.2.0"),
        .package(url: "https://github.com/twostraws/SwiftGD.git", from: "2.5.0")
    ],
    targets: [
        .target(name: "Lambda", dependencies: [
            .product(name: "AWSLambdaRuntime", package: "swift-aws-lambda-runtime"),
            .product(name: "AWSLambdaEvents", package: "swift-aws-lambda-runtime"),
            .product(name: "SwiftGD", package: "SwiftGD")
        ])
    ]
)
