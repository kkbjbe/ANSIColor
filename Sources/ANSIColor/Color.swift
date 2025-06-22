public struct Color: Sendable {
    public let r: Int
    public let g: Int
    public let b: Int
    public let a: Double

    public init(r: Int, g: Int, b: Int, a: Double = 1.0) {
        self.r = max(0, min(255, r))
        self.g = max(0, min(255, g))
        self.b = max(0, min(255, b))
        self.a = max(0.0, min(1.0, a))
    }

    public init(r: Double, g: Double, b: Double, a: Double = 1.0) {
        self.init(
            r: Int(r * 255.0),
            g: Int(g * 255.0),
            b: Int(b * 255.0),
            a: a
        )
    }

    public init?(hex: String) {
        guard let color = Color.parseHex(hex) else { return nil }
        self = color
    }

    public init(hex: String, `default`: Color) {
        self = Color.parseHex(hex) ?? `default`
    }

    private static func parseHex(_ hex: String) -> Color? {
        var hexString = hex
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }

        func hexToInt(_ s: Substring) -> Int? {
            Int(s, radix: 16)
        }

        switch hexString.count {
        case 3:
            let chars = Array(hexString)
            guard
                let r = hexToInt("\(chars[0])\(chars[0])"),
                let g = hexToInt("\(chars[1])\(chars[1])"),
                let b = hexToInt("\(chars[2])\(chars[2])")
            else { return nil }
            return Color(r: r, g: g, b: b)

        case 6:
            guard
                let r = hexToInt(hexString.prefix(2)),
                let g = hexToInt(hexString.dropFirst(2).prefix(2)),
                let b = hexToInt(hexString.dropFirst(4).prefix(2))
            else { return nil }

            return Color(r: r, g: g, b: b)

        default:
            return nil
        }
    }
}

extension Color {
    public var ansiForeground: String {
        "\u{001B}[38;2;\(r);\(g);\(b)m"
    }

    public var ansiBackground: String {
        "\u{001B}[48;2;\(r);\(g);\(b)m"
    }
}

extension Color {
    public static let red = Color(r: 255, g: 0, b: 0)
    public static let orange = Color(r: 255, g: 165, b: 0)
    public static let yellow = Color(r: 255, g: 255, b: 0)
    public static let green = Color(r: 0, g: 255, b: 0)
    public static let cyan = Color(r: 0, g: 255, b: 255)
    public static let blue = Color(r: 0, g: 0, b: 255)
    public static let violet = Color(r: 148, g: 0, b: 211)

    public static let black = Color(r: 0, g: 0, b: 0)
    public static let white = Color(r: 255, g: 255, b: 255)
    public static let gray = Color(r: 128, g: 128, b: 128)
    public static let pink = Color(r: 255, g: 192, b: 203)
    public static let purple = Color(r: 128, g: 0, b: 128)
    public static let brown = Color(r: 139, g: 69, b: 19)
    public static let darkGray = Color(r: 64, g: 64, b: 64)
    public static let lightGray = Color(r: 211, g: 211, b: 211)

    public static let rainbow: [Color] = [
        .red, .orange, .yellow, .green, .cyan, .blue, .violet,
    ]
}
