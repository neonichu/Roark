import PackageDescription

let package = Package(
  name: "Roark",
  targets: [
    Target(name: "test", dependencies: [.Target(name: "Roark")]),
  ],
  dependencies: [
    .Package(url: "https://github.com/neonichu/Chores", majorVersion: 0),
  ]
)
