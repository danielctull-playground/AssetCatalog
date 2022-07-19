
public struct Color: Equatable {
    public let colorSpace: ColorSpace
    public let red: Double
    public let green: Double
    public let blue: Double
    public let alpha: Double

    public init(
        colorSpace: ColorSpace,
        red: Double,
        green: Double,
        blue: Double,
        alpha: Double
    ) {
        self.colorSpace = colorSpace
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}

// MARK: - Codable

struct CodableColor: Decodable {

    fileprivate struct Components: Decodable {

        fileprivate struct Value: Decodable {
            let rawValue: Double
        }

        let red: Value
        let green: Value
        let blue: Value
        let alpha: Value
    }

    enum CodingKeys: String, CodingKey {
        case colorSpace = "color-space"
        case components
    }

    fileprivate let colorSpace: CodableColorSpace?
    fileprivate let components: Components
}

extension CodableColor.Components.Value {

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let double = try? container.decode(Double.self) {
            self.rawValue = double
            return
        }

        let string = try container.decode(String.self)

        guard let double = Double(string) else {
            struct IncorrectType<Expected, Received>: Error {
                let expected: Expected.Type
                let received: Received
            }
            throw IncorrectType(expected: Double.self, received: string)
        }

        self.rawValue = double
    }
}

extension Color {

    init(codable: CodableColor) {
        self.init(
            colorSpace: ColorSpace(codable: codable.colorSpace),
            red: codable.components.red.rawValue,
            green: codable.components.green.rawValue,
            blue: codable.components.blue.rawValue,
            alpha: codable.components.alpha.rawValue
        )
    }
}
