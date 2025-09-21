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
            #if DEBUG
            assertionFailure("\(error)")
            #endif
            return .white
        }
    }

    public static func hex(s: String,) throws -> Color {
        let (r, g, b, a) = try pickVolume(hex: s)
        return Color(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
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
        return Array(origin).map({c in return "\(c)\(c)"}).joined()
    }

    private static func hexToInt(hex: String) throws -> (Int, Int, Int, Int) {
        let chars:[Character] = Array(hex)
        guard let r = Int(String([chars[0], chars[1]]), radix: 16) else {
            throw HexColorException.TransHexFailed
        }
        guard let g = Int(String([chars[2], chars[3]]), radix: 16) else {
            throw HexColorException.TransHexFailed
        }
        guard let b = Int(String([chars[4], chars[5]]), radix: 16) else {
            throw HexColorException.TransHexFailed
        }
        guard let a = Int(String([chars[6], chars[7]]), radix: 16) else {
            throw HexColorException.TransHexFailed
        }
        return (r, g, b, a)
    }
}
