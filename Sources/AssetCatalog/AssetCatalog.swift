
import Foundation

public struct AssetCatalog {
    public let name: String
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

        self.init(name: name)
    }
}
