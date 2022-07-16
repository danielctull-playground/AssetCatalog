
import Foundation

public struct AssetCatalog: Equatable {
    public let name: String
    public let items: [Item]
    public init(name: String, items: [Item]) {
        self.name = name
        self.items = items
    }
}

extension AssetCatalog {

    public init(url: URL) throws {

        guard url.pathExtension == "xcassets" else {
            struct UnknownFileType: Error {
                let pathExtension: String
            }
            throw UnknownFileType(pathExtension: url.pathExtension)
        }

        var name = url.lastPathComponent
        name.removeLast(url.pathExtension.count + 1)

        let contents = try FileManager().contentsOfDirectory(at: url, includingPropertiesForKeys: nil)

        let items: [Item] = try contents.compactMap { url in
            switch url.pathExtension {
            case "json": return nil
            case "": return try Item.group(Group(url: url))
            default: return try Item.asset(Asset(url: url))
            }
        }

        self.init(name: name, items: items)
    }
}
