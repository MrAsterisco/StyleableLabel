// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "StyleableLabel",
  platforms: [
    .iOS(.v9)
  ],
  products: [
    .library(
      name: "StyleableLabel",
      targets: ["StyleableLabel"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "StyleableLabel",
      dependencies: [],
      path: "StyleableLabel",
      sources: [
        ".",
        "Classes"
      ]
    )
  ]
)
