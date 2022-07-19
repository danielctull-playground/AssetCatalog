
public struct Idiom: Equatable {
    fileprivate let rawValue: String
    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Idiom {

    /// An image shown app launcher on watchOS.
    public static let appLauncher = Idiom("appLauncher")

    /// An image for the Apple Watch Settings app.
    public static let companionSettings = Idiom("companionSettings")

    /// An image for the App Store icon.
    public static let iOSMarketing = Idiom("ios-marketing")

    /// The image is for iPhone devices.
    public static let iPhone = Idiom("iphone")

    /// The image is for iPad devices.
    public static let iPad = Idiom("ipad")

    /// The image is for Mac computers.
    public static let mac = Idiom("mac")

    /// An image for the notification center on watchOS.
    public static let notificationCenter = Idiom("notificationCenter")

    /// An image used for a long look on watchOS.
    public static let quickLook = Idiom("quickLook")

    /// The image is for Apple TV.
    public static let tv = Idiom("tv")

    /// The image works on any device and platform.
    public static let universal = Idiom("universal")

    /// The image is for the Apple Watch devices.
    public static let watch = Idiom("watch")

    /// An image for the App Store icon.
    public static let watchMarketing = Idiom("watch-marketing")
}

// MARK: - Codable

struct CodableIdiom {
    let rawValue: String
}

extension CodableIdiom: Codable {

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}

extension Idiom {

    // If tag is not included, this is the same as specifying universal.
    // https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/ImageSetType.html#//apple_ref/doc/uid/TP40015170-CH25-SW2
    init(codable: CodableIdiom?) {
        if let rawValue = codable?.rawValue {
            self.init(rawValue)
        } else {
            self = .universal
        }
    }
}

extension CodableIdiom {

    init(idiom: Idiom) {
        self.init(rawValue: idiom.rawValue)
    }
}
