
import Foundation

public enum Item: Equatable {
    case group(Group)
    case asset(Asset)
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
