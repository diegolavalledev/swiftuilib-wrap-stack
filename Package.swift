// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "SwiftUILib-WrapStack",
  platforms: [ .iOS(.v13), .macOS(.v10_15) ],
  products: [
    .library(
      name: "SwiftUILib.WrapStack",
      targets: ["SwiftUILib_WrapStack"]),
  ],
  targets: [
    .target(
      name: "SwiftUILib_WrapStack",
      path: "src"),
    .testTarget(
      name: "SwiftUILib-WrapStackTests",
      dependencies: ["SwiftUILib_WrapStack"],
      path: "test"),
  ]
)
