
public struct ColorSpace: Equatable {
    fileprivate let value: String
    public static let sRGB = ColorSpace(value: "srgb")
    public static let displayP3 = ColorSpace(value: "display-p3")
}

// MARK: - Codable

struct CodableColorSpace {
    let value: String
}

extension CodableColorSpace: Codable {

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        value = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}

extension ColorSpace {

    init(codable: CodableColorSpace) {
        self.init(value: codable.value)
    }
}

extension CodableColorSpace {

    init(colorSpace: ColorSpace) {
        self.init(value: colorSpace.value)
    }
}
