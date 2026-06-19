// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "VachaVox99",
    platforms: [
        .macOS(.v26)
    ],
    products: [
        .library(name: "VachaVoxCore", targets: ["VachaVoxCore"]),
        .executable(name: "VachaVoxCoreSelfTest", targets: ["VachaVoxCoreSelfTest"]),
        .executable(name: "SpeechFeasibilitySpike", targets: ["SpeechFeasibilitySpike"])
    ],
    targets: [
        .target(name: "VachaVoxCore"),
        .executableTarget(
            name: "VachaVoxCoreSelfTest",
            dependencies: ["VachaVoxCore"]
        ),
        .executableTarget(
            name: "SpeechFeasibilitySpike",
            dependencies: ["VachaVoxCore"]
        )
    ]
)
