
import Foundation

public struct Asset: Equatable {
    public let name: String
    public init(name: String) {
        self.name = name
    }
}


extension Asset {

    public init(url: URL) throws {
        self.init(name: url.filename)
    }
}
