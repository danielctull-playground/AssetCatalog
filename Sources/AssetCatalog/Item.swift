
import Foundation

public enum Item: Equatable {
    case asset(Asset)
    case group(Group)
}

extension Item {

    public static func asset(name: String, kind: Asset.Kind) -> Self {
        .asset(Asset(name: name, kind: kind))
    }

    public static func group(name: String, items: [Item]) -> Self {
        .group(Group(name: name, items: items))
    }
}

extension Array where Element == Item {

    init(url: URL) throws {

        let contents = try FileManager()
            .contentsOfDirectory(at: url, includingPropertiesForKeys: nil)

        self = try contents.compactMap { url in
            switch url.pathExtension {
            case "json": return nil
            case "": return try Item.group(Group(url: url))
            default: return try Item.asset(Asset(url: url))
            }
        }
    }
}
