
public struct DisplayGamut: Equatable {
    fileprivate let rawValue: String
    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

extension DisplayGamut {

    /// The image uses the standard sRGB color space.
    public static let sRGB = DisplayGamut("sRGB")

    /// The image uses a wide gamut color space.
    public static let displayP3 = DisplayGamut("display-P3")
}

// MARK: - Codable

struct CodableDisplayGamut: RawRepresentable, Codable {
    let rawValue: String
}

extension DisplayGamut {

    // If tag is not included, this is the same as specifying sRGB.
    // https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/ImageSetType.html#//apple_ref/doc/uid/TP40015170-CH25-SW35
    init(codable: CodableDisplayGamut?) {
        if let rawValue = codable?.rawValue {
            self.init(rawValue)
        } else {
            self = .sRGB
        }
    }
}

extension CodableDisplayGamut {

    init(displayGamut: DisplayGamut) {
        self.init(rawValue: displayGamut.rawValue)
    }
}
