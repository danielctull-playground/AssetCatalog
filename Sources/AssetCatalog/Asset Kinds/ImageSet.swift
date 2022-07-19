
import Foundation

public struct ImageSet: Equatable {
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

extension ImageSet {

    public struct Value: Equatable {

        public let colorSpace: ColorSpace
        public let displayGamut: DisplayGamut
        public let idiom: Idiom

        public init(
            colorSpace: ColorSpace,
            displayGamut: DisplayGamut,
            idiom: Idiom
        ) {
            self.colorSpace = colorSpace
            self.displayGamut = displayGamut
            self.idiom = idiom
        }
    }
}

extension ImageSet {

    init(url: URL) throws {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let codable = try decoder.decode(CodableImageSet.self, from: data)
        self.init(codable: codable)
    }
}

// MARK: - Codable

struct CodableImageSet: Decodable {
    let info: CodableInfo
    let images: [CodableImageSetValue]
}

extension ImageSet {

    init(codable: CodableImageSet) {
        self.init(
            info: Info(codable: codable.info),
            values: codable.images.map(Value.init))
    }
}

extension ImageSet.Value {

    init(codable: CodableImageSetValue) {
        self.init(
            colorSpace: ColorSpace(codable: codable.colorSpace),
            displayGamut: DisplayGamut(codable: codable.displayGamut),
            idiom: Idiom(codable: codable.idiom))
    }
}

struct CodableImageSetValue: Decodable {

    enum CodingKeys: String, CodingKey {
        case colorSpace = "color-space"
        case displayGamut = "display-gamut"
        case idiom
    }

    let colorSpace: CodableColorSpace?
    let displayGamut: CodableDisplayGamut?
    let idiom: CodableIdiom?
}
