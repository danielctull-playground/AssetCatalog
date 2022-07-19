
public struct DisplayGamut: Equatable {
    fileprivate let rawValue: String
    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

extension DisplayGamut: OptionalAttribute {

    static let nilValue = DisplayGamut.sRGB

    /// The image uses the standard sRGB color space.
    public static let sRGB = DisplayGamut("sRGB")

    /// The image uses a wide gamut color space.
    public static let displayP3 = DisplayGamut("display-P3")
}

// MARK: - Codable

extension DisplayGamut {

    struct Codable: RawRepresentable, Decodable {
        let rawValue: String
    }
}
