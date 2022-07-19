
public struct ColorSpace: Equatable {
    fileprivate let rawValue: String
    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

extension ColorSpace {

    /// The image uses the standard sRGB color space.
    public static let sRGB = ColorSpace("srgb")

    /// The image uses a wide gamut color space.
    public static let displayP3 = ColorSpace("display-p3")
}

// MARK: - Codable

struct CodableColorSpace {
    let rawValue: String
}

extension CodableColorSpace: Codable {

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

extension ColorSpace {

    init(codable: CodableColorSpace) {
        self.init(codable.rawValue)
    }
}

extension CodableColorSpace {

    init(colorSpace: ColorSpace) {
        self.init(rawValue: colorSpace.rawValue)
    }
}
