import PackageDescription

let package = Package(
  name: "Roark",
  targets: [
    Target(name: "test", dependencies: [.Target(name: "Roark")]),
  ],
  dependencies: [
    .Package(url: "https://github.com/neonichu/Chores", majorVersion: 0),
  ],
  testDependencies: [
    .Package(url: "https://github.com/neonichu/spectre-build.git", majorVersion: 0),
  ]
)
