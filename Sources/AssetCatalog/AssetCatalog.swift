
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

        self.init(name: name, items: try Array(url: url))
    }
}
