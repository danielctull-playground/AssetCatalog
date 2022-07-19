
public struct Idiom: Equatable {
    fileprivate let rawValue: String
    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Idiom: OptionalAttribute {

    static let nilValue = Idiom.universal

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

extension Idiom {

    struct Codable: RawRepresentable, Decodable {
        let rawValue: String
    }
}
