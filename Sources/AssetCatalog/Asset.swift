
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

    public enum Kind: Equatable {
        case appIcon
        case arReferenceImage
        case arResourceGroup
        case brandAssets
        case cubeTexture
        case dataSet
        case gameCenterDashboardImageSet
        case gameCenterLeaderboard
        case gameCenterLeaderboardSet
        case iconSet
        case imageSet
        case imageStack
        case imageStackLayer
        case launchImage
        case mipmap
        case namedColor(NamedColor)
        case spriteAtlas
        case sticker
        case stickerPack
        case stickerSequence
        case texture
        case watchComplications
    }
}

struct UnknownAssetType: Error {
    let pathExtension: String
}

extension Asset.Kind {

    init(url: URL) throws {
        switch url.pathExtension {
        case "appiconset": self = .appIcon
        case "arimageset": self = .arReferenceImage
        case "arresourcegroup": self = .arResourceGroup
        case "brandassets": self = .brandAssets
        case "cubetextureset": self = .cubeTexture
        case "dataset": self = .dataSet
        case "gcdashboardimage": self = .gameCenterDashboardImageSet
        case "gcleaderboard": self = .gameCenterLeaderboard
        case "gcleaderboardset": self = .gameCenterLeaderboardSet
        case "iconset": self = .iconSet
        case "imageset": self = .imageSet
        case "imagestack": self = .imageStack
        case "imagestacklayer": self = .imageStackLayer
        case "launchimage": self = .launchImage
        case "mipmapset": self = .mipmap
        case "colorset": self = try .namedColor(NamedColor(url: url))
        case "spriteatlas": self = .spriteAtlas
        case "sticker": self = .sticker
        case "stickerpack": self = .stickerPack
        case "stickersequence": self = .stickerSequence
        case "textureset": self = .texture
        case "complicationset": self = .watchComplications
        default: throw UnknownAssetType(pathExtension: url.pathExtension)
        }
    }
}
