
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

struct CodableColorSpace: RawRepresentable, Codable {
    let rawValue: String
}

extension ColorSpace {

    // If tag is not included, this is the same as specifying sRGB.
    // https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/ImageSetType.html#//apple_ref/doc/uid/TP40015170-CH25-SW5
    init(codable: CodableColorSpace?) {
        if let rawValue = codable?.rawValue {
            self.init(rawValue)
        } else {
            self = .sRGB
        }
    }
}

extension CodableColorSpace {

    init(colorSpace: ColorSpace) {
        self.init(rawValue: colorSpace.rawValue)
    }
}
