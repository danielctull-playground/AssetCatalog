
import Foundation

public struct Group: Equatable {
    public let name: String
    public let items: [Item]
    public init(name: String, items: [Item]) {
        self.name = name
        self.items = items
    }
}

extension Group {

    public init(url: URL) throws {

        guard url.pathExtension == "" else {
            struct UnknownFileType: Error {
                let pathExtension: String
            }
            throw UnknownFileType(pathExtension: url.pathExtension)
        }

        var name = url.lastPathComponent
        name.removeLast(url.pathExtension.count + 1)

        let contents = try FileManager().contentsOfDirectory(at: url, includingPropertiesForKeys: nil)

        let items = try contents.map { url in
            switch url.pathExtension {
            case "": return try Item.group(Group(url: url))
            default: return try Item.asset(Asset(url: url))
            }
        }

        self.init(name: name, items: items)
    }
}
