
import Foundation

public struct NamedColor: Equatable {
    public let info: Info
    public let values: [Value]

    public init(
        info: Info,
        values: [Value]
    ) {
        self.info = info
        self.values = values
    }
}

extension NamedColor {

    public struct Value: Equatable {
        public let color: Color
        public let idiom: Idiom

        public init(color: Color, idiom: Idiom) {
            self.color = color
            self.idiom = idiom
        }
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

struct CodableNamedColor: Decodable {
    let info: CodableInfo
    let colors: [CodableNamedColorValue]
}

extension NamedColor {

    init(codable: CodableNamedColor) {
        self.init(
            info: Info(codable: codable.info),
            values: codable.colors.map(Value.init))
    }
}

extension NamedColor.Value {

    init(codable: CodableNamedColorValue) {
        self.init(
            color: Color(codable: codable.color),
            idiom: Idiom(codable: codable.idiom))
    }

}

struct CodableNamedColorValue: Decodable {
    let color: CodableColor
    let idiom: CodableIdiom
}
