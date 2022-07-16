
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
            .asset(Asset(name: "Color", kind: .namedColor))
        ])
    }
}
