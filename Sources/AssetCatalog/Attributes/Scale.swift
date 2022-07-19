
public struct Scale: Equatable {
    fileprivate let rawValue: String?
    public init(_ rawValue: String?) {
        self.rawValue = rawValue
    }
}

extension Scale {

    /// The image is for any display scale and should point to a .pdf file.
    public static let pdf = Self(nil)

    /// Targeted for unscaled displays.
    public static let bitmap1x = Self("1x")

    /// Targeted for Retina displays.
    public static let bitmap2x = Self("2x")

    /// Targeted for Retina displays with higher density such as those on the
    /// iPhone 6 Plus.
    public static let bitmap3x = Self("3x")
}

// MARK: - Codable

struct CodableScale: RawRepresentable, Decodable {
    let rawValue: String
}

extension Scale {

    init(codable: CodableScale?) {
        self.init(codable?.rawValue)
    }
}
