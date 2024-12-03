@preconcurrency import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "CheongForDo",
    platform: .iOS,
    product: .app,
    dependencies: [
        .SPM.Moya,
        .SPM.Alamofire,
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
