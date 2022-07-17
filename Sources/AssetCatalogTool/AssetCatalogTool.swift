
import ArgumentParser
import AssetCatalog
import FileBuilder
import Foundation

@main
struct AssetCatalogTool: ParsableCommand {

    @Argument(transform: { URL(fileURLWithPath: $0) })
    var input: URL

    @Argument(transform: { URL(fileURLWithPath: $0) })
    var output: URL

    func run() throws {

        let catalog = try AssetCatalog(url: input)
        let colors = catalog.allAssets.filter { $0.kind == .namedColor }

        let file = File {
            "import SwiftUI"
            ""
            Extension("Color") {
                for color in colors {
                    #"public static let \#(color.name.lowercased()) = Color("\#(color.name)", bundle: .module)"#
                }
            }
        }

        try file.content.write(to: output, atomically: true, encoding: .utf8)
    }
}

struct Extension<C: Content>: Content {

    let name: String
    let content: C
    init(_ name: String, @ContentBuilder content: () -> C) {
        self.name = name
        self.content = content()
    }

    var body: some Content {
        "extension \(name) {"
        content.indented()
        "}"
    }
}
