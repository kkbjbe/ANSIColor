public enum ANSIColor {
    public static let reset = "\u{001B}[0m"

    public static func colorize(
        _ text: String,
        foreground: Color? = nil,
        background: Color? = nil,
        bold: Bool = false,
        italic: Bool = false,
        underline: Bool = false
    ) -> String {
        var code = ""

        if bold { code += "\u{001B}[1m" }
        if italic { code += "\u{001B}[3m" }
        if underline { code += "\u{001B}[4m" }

        if let fg = foreground {
            code += fg.ansiForeground
        }

        if let bg = background {
            code += bg.ansiBackground
        }

        return code + text + reset
    }
}

extension String {
    public func colorize(
        foreground: Color? = nil,
        background: Color? = nil,
        bold: Bool = false,
        italic: Bool = false,
        underline: Bool = false
    ) -> String {
        ANSIColor.colorize(
            self, foreground: foreground, background: background,
            bold: bold, italic: italic, underline: underline
        )
    }
}
