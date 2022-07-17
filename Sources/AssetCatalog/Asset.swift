
import Foundation

public struct Asset: Equatable {
    public let name: String
    public let kind: Kind
    public init(name: String, kind: Kind) {
        self.name = name
        self.kind = kind
    }
}

extension Asset {

    public init(url: URL) throws {
        try self.init(name: url.filename, kind: Kind(url: url))
    }
}

// MARK: - Asset Kind

extension Asset {

    public struct Kind: Equatable {
        let rawValue: String
    }
}

extension Asset.Kind {
    public static let appIcon = Self(rawValue: "appiconset")
    public static let arReferenceImage = Self(rawValue: "arimageset")
    public static let arResourceGroup = Self(rawValue: "arresourcegroup")
    public static let brandAssets = Self(rawValue: "brandassets")
    public static let cubeTexture = Self(rawValue: "cubetextureset")
    public static let dataSet = Self(rawValue: "dataset")
    public static let gameCenterDashboardImageSet = Self(rawValue: "gcdashboardimage")
    public static let gameCenterLeaderboard = Self(rawValue: "gcleaderboard")
    public static let gameCenterLeaderboardSet = Self(rawValue: "gcleaderboardset")
    public static let iconSet = Self(rawValue: "iconset")
    public static let imageSet = Self(rawValue: "imageset")
    public static let imageStack = Self(rawValue: "imagestack")
    public static let imageStackLayer = Self(rawValue: "imagestacklayer")
    public static let launchImage = Self(rawValue: "launchimage")
    public static let mipmap = Self(rawValue: "mipmapset")
    public static let namedColor = Self(rawValue: "colorset")
    public static let spriteAtlas = Self(rawValue: "spriteatlas")
    public static let sticker = Self(rawValue: "sticker")
    public static let stickerPack = Self(rawValue: "stickerpack")
    public static let stickerSequence = Self(rawValue: "stickersequence")
    public static let texture = Self(rawValue: "textureset")
    public static let watchComplications = Self(rawValue: "complicationset")
}

struct UnknownAssetType: Error {
    let pathExtension: String
}

extension Asset.Kind {

    init(url: URL) throws {
        self.init(rawValue: url.pathExtension)
    }
}
