import Testing
import SwiftUI
@testable import SeadripUtils

@Test func hexColor() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    guard let _ = try? Color.hex(s: "#fff") else { return }
}

@Test func hexConst() async {
    let _ = Color.hexConstant(s: "#ffcef")
}
