@preconcurrency import ProjectDescription

public extension TargetDependency {
    struct SPM { }
}

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
    static let Gifu = TargetDependency.external(name: "Gifu")
}

public extension Package {}
