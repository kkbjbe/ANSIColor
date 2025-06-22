import Testing

@testable import ANSIColor

@Test func example() async throws {
    let text = "Hello ANSIColor"

    if let color = Color(hex: "#FFAADE") {
        #expect(color.r == 255)
        #expect(color.g == 170)
        #expect(color.b == 222)
        #expect(color.a == 1.0)

        print(text.colorize(foreground: color, bold: true, italic: true, underline: true))
    } else {
        preconditionFailure("Color initialization failed")
    }

    print(text.colorize(foreground: Color.red, background: Color.green))

    let rgba = Color(r: 0.0, g: 0.0, b: 0.0, a: 0.5)
    print("RGBA".colorize(foreground: rgba))

    let abc = Color(hex: "#ABC")
    print("ABC".colorize(foreground: abc))

    let hex1 = Color(hex: "#Z", default: .red)
    #expect(hex1.r == 255)

    let hex3 = Color(hex: "#ZZZ", default: .green)
    #expect(hex3.g == 255)

    let hex6 = Color(hex: "#ZZZZZZ", default: .blue)
    #expect(hex6.b == 255)

    for (i, char) in text.enumerated() {
        let color = Color.rainbow[i % Color.rainbow.count]
        print(String(char).colorize(foreground: color), terminator: "")
    }
}
