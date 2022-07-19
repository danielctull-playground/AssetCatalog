
public struct ColorSpace: Equatable {
    fileprivate let rawValue: String
    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

protocol OptionalAttribute {
    associatedtype Codable: RawRepresentable
    static var nilValue: Self { get }
    init(_ rawValue: Codable.RawValue)
}

extension ColorSpace: OptionalAttribute {

    public static let nilValue = ColorSpace.sRGB

    /// The image uses the standard sRGB color space.
    public static let sRGB = ColorSpace("srgb")

    /// The image uses a wide gamut color space.
    public static let displayP3 = ColorSpace("display-p3")
}

// MARK: - Codable

extension ColorSpace {

    struct Codable: RawRepresentable, Decodable {
        let rawValue: String
    }
}

extension OptionalAttribute {

    init(_ codable: Codable?) {
        
        if let rawValue = codable?.rawValue {
            self.init(rawValue)
        } else {
            self = .nilValue
        }
    }
}
