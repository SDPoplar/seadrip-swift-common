// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public enum HexColorException: String, Error, CustomStringConvertible {
    public var description: String {
        return self.rawValue
    }

    case IncorrectInputFormat = "incorrect input format"
    case TransHexFailed = "translate hex failed"
}

extension Color {
    public static func hexConstant(s: String) -> Color {
        do {
            return try hex(s: s)
        } catch {
            fatalError("\(error)")
        }
    }

    public static func hex(s: String,) throws -> Color {
        let (r, g, b, a) = try pickVolume(hex: s)
        return Color(
            r / 255.0,
            g / 255.0,
            b / 255.0,
            a / 255.0
        )
    }
        
    private static func pickVolume(hex: String) throws -> (Int, Int, Int, Int) {
        guard let result = try /^#*([\dA-Fa-f]+)$/.wholeMatch(in: hex) else {
            throw HexColorException.IncorrectInputFormat
        }
        let pure = String(result.1).uppercased()
        switch(pure.count) {
        case 3:
            return try hexToInt(hex: twice(origin: pure) + "FF")
        case 4:
            return try hexToInt(hex: twice(origin: pure))
        case 6:
            return try hexToInt(hex: pure + "FF")
        case 8:
            return try hexToInt(hex: pure)
        default:
            throw HexColorException.IncorrectInputFormat
        }
    }

    private static func twice(origin: String) -> String {
        var ret = ""
        for c in Array(origin) {
            ret += "\(c)\(c)"
        }
        return ret
    }

    private func hexToInt(hex: String) throws -> (Int, Int, Int, Int) {
        do {
            let chars:[Character] = Array(hex)
            let r = Int(String([chars[0], chars[1]]), radix: 16)
            let g = Int(String([chars[2], chars[3]]), radix: 16)
            let b = Int(String([chars[4], chars[5]]), radix: 16)
            let a = Int(String([chars[6], chars[7]]), radix: 16)
            return (r!, g!, b!, a!)
        } catch {
            throw HexColorException.TransHexFailed
        }
    }
}
