@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: [
        .remote(
            url: "https://github.com/Moya/Moya",
            requirement: .upToNextMajor(from: "15.0.0")),
        .remote(
            url: "https://github.com/Alamofire/Alamofire",
            requirement: .upToNextMinor(from: "5.0.0")),
        .remote(
            url: "https://github.com/onevcat/Kingfisher",
            requirement: .upToNextMajor(from: "8.3.0"))
    ],
    platforms: [.iOS]
)

