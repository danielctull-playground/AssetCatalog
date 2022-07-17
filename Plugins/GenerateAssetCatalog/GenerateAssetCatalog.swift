
import PackagePlugin

@main
struct GenerateAssetCatalog: BuildToolPlugin {

    func createBuildCommands(
        context: PluginContext,
        target: Target
    ) async throws -> [PackagePlugin.Command] {

        guard let target = target as? SourceModuleTarget else { return [] }

        return try target.sourceFiles(withSuffix: "xcassets").map { catalog in

            let input = catalog.path
            let output = context
                .pluginWorkDirectory
                .appending(["\(input.stem).swift"])

            return .buildCommand(
                displayName: "Generating file for \(input)",
                executable: try context.tool(named: "AssetCatalogTool").path,
                arguments: [input.string, output.string],
                inputFiles: [input],
                outputFiles: [output])
        }
    }
}
