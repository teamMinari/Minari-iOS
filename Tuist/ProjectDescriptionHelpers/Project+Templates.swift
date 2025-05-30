import ProjectDescription

public extension Project {
    static func makeModule(
        name: String,
        platform: Platform = .iOS,
        product: Product,
        organizationName: String = "net.sinminho",
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "16.0", devices: [.iphone]),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default,
        additionalFiles: [FileElement] = []
    ) -> Project {
        let settings: Settings = .settings(
            base: ["DEVELOPMENT_TEAM": "C22QH9P7HR"],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ]
        )

        let appTarget = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "\(organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies,
            additionalFiles: additionalFiles
        )

        let schemes: [Scheme] = [
            .makeScheme(target: .debug, name: name, targets: ["CFD"]),
            .makeScheme(target: .release, name: "\(name)-Release", targets: ["CFD"])
        ]
        
        
        let targets: [Target] = [appTarget]

        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String, targets: [TargetReference] = []) -> Scheme {
        return Scheme(
            name: name,
            buildAction: .buildAction(targets: targets),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
