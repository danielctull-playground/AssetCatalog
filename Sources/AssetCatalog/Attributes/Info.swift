
public struct Info: Equatable {
    public let author: String
    public let version: Int

    public init(author: String, version: Int) {
        self.author = author
        self.version = version
    }
}

// MARK: - Codable

struct CodableInfo: Codable {
    let author: String
    let version: Int
}

extension Info {

    init(codable: CodableInfo) {
        self.init(
            author: codable.author,
            version: codable.version)
    }
}

extension CodableInfo {

    init(info: Info) {
        self.init(
            author: info.author,
            version: info.version)
    }
}
