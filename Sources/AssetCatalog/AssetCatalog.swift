
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
            throw IncorrectFileExtension(expected: "xcassets",
                                         received: url.pathExtension)
        }

        self.init(name: url.filename, items: try Array(url: url))
    }

    public var allAssets: [Asset] {
        items.allAssets
    }
}
