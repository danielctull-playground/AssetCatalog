
import Foundation

public struct Asset: Equatable {
    public let name: String
    public init(name: String) {
        self.name = name
    }
}


extension Asset {

    public init(url: URL) throws {
        var name = url.lastPathComponent
        name.removeLast(url.pathExtension.count + 1)
        self.init(name: name)
    }
}
