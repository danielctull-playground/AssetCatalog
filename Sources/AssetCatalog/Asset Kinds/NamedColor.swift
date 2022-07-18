
import Foundation

public struct NamedColor: Equatable {
    public let info: Info

    public init(
        info: Info
    ) {
        self.info = info
    }
}

extension NamedColor {

    init(url: URL) throws {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let codable = try decoder.decode(CodableNamedColor.self, from: data)
        self.init(codable: codable)
    }
}

// MARK: - Codable

struct CodableNamedColor: Codable {
    let info: CodableInfo
}

extension NamedColor {

    init(codable: CodableNamedColor) {
        self.init(
            info: Info(codable: codable.info))
    }
}

extension CodableNamedColor {

    init(namedColor: NamedColor) {
        self.init(
            info: CodableInfo(info: namedColor.info))
    }
}
