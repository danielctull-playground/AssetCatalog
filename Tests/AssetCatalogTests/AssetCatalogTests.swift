
import AssetCatalog
import XCTest

extension Bundle {

    func assetsURL(named: String) throws -> URL {
        try XCTUnwrap(url(forResource: "Resources", withExtension: nil))
            .appendingPathComponent(named)
            .appendingPathExtension("xcassets")
    }
}

final class AssetCatalogTests: XCTestCase {

    func test() throws {
        let url = try Bundle.module.assetsURL(named: "Assets")
        let catalog = try AssetCatalog(url: url)
        XCTAssertEqual(catalog.name, "Assets")
        XCTAssertEqual(catalog.items, [
            .asset(
                name: "Color",
                kind: .namedColor(NamedColor(
                    info: Info(author: "xcode", version: 1),
                    values: [
                        NamedColor.Value(
                            color: Color(colorSpace: .sRGB, red: 1, green: 1, blue: 1, alpha: 1),
                            displayGamut: DisplayGamut.sRGB,
                            idiom: .universal),
                        NamedColor.Value(
                            color: Color(colorSpace: .sRGB, red: 1, green: 1, blue: 1, alpha: 1),
                            displayGamut: DisplayGamut.sRGB,
                            idiom: .universal)
                    ]))),
            .asset(
                name: "Image",
                kind: .imageSet(ImageSet(
                    info: Info(author: "xcode", version: 1),
                    values: [
                        .init(colorSpace: .sRGB, displayGamut: .sRGB, idiom: .universal),
                        .init(colorSpace: .sRGB, displayGamut: .sRGB, idiom: .universal),
                        .init(colorSpace: .sRGB, displayGamut: .sRGB, idiom: .universal),
                    ])))
        ])
        XCTAssertEqual(catalog.allAssets, [
            Asset(
                name: "Color",
                kind: .namedColor(NamedColor(
                    info: Info(author: "xcode", version: 1),
                    values: [
                        NamedColor.Value(
                            color: Color(colorSpace: .sRGB, red: 1, green: 1, blue: 1, alpha: 1),
                            displayGamut: DisplayGamut.sRGB,
                            idiom: .universal),
                        NamedColor.Value(
                            color: Color(colorSpace: .sRGB, red: 1, green: 1, blue: 1, alpha: 1),
                            displayGamut: DisplayGamut.sRGB,
                            idiom: .universal)
                    ]))),
            Asset(
                name: "Image",
                kind: .imageSet(ImageSet(
                    info: Info(author: "xcode", version: 1),
                    values: [
                        .init(colorSpace: .sRGB, displayGamut: .sRGB, idiom: .universal),
                        .init(colorSpace: .sRGB, displayGamut: .sRGB, idiom: .universal),
                        .init(colorSpace: .sRGB, displayGamut: .sRGB, idiom: .universal),
                    ])))
        ])
    }
}
