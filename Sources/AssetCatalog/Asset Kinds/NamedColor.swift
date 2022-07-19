
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
        public let displayGamut: DisplayGamut
        public let idiom: Idiom

        public init(color: Color, displayGamut: DisplayGamut, idiom: Idiom) {
            self.color = color
            self.displayGamut = displayGamut
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
            displayGamut: DisplayGamut(codable.displayGamut),
            idiom: Idiom(codable: codable.idiom))
    }
}

struct CodableNamedColorValue: Decodable {

    enum CodingKeys: String, CodingKey {
        case color
        case displayGamut = "display-gamut"
        case idiom
    }

    let color: CodableColor
    let displayGamut: DisplayGamut.Codable?
    let idiom: CodableIdiom?
}
