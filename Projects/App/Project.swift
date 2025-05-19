@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "CFD",
    platform: .iOS,
    product: .app,
    dependencies: [
        .SPM.Moya,
        .SPM.Alamofire,
        .SPM.Kingfisher,
        .SPM.Gifu
    ],
    resources: ["Resources/**", "Support/ApiContent.plist"],
    infoPlist: .file(path: "Support/Info.plist")
)
