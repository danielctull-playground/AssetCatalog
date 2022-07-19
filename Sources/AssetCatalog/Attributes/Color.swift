
public struct Color: Equatable {
    public let colorSpace: ColorSpace

    public init(colorSpace: ColorSpace) {
        self.colorSpace = colorSpace
    }
}

// MARK: - Codable

struct CodableColor: Codable {

    enum CodingKeys: String, CodingKey {
        case colorSpace = "color-space"
    }

    let colorSpace: CodableColorSpace?
}

extension Color {

    init(codable: CodableColor) {
        self.init(
            colorSpace: ColorSpace(codable: codable.colorSpace))
    }
}
