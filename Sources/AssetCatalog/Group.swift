
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
            throw IncorrectFileExtension(expected: "",
                                         received: url.pathExtension)
        }

        self.init(name: url.filename, items: try Array(url: url))
    }
}
