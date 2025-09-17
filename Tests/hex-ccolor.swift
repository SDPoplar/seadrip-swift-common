import Testing
@testable import SeadripUtils

@Test func hexColor() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    do {
        let (r, g, b, a) = try pickVolume(hex: "#fff")
        print(r, g, b, a)
    } catch {
        print(error)
    }
}
