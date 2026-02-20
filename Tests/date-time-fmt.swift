//
//  date-time-fmt.swift
//  seadrip-utils
//
//  Created by Poplar on 2026/2/21.
//

import Testing
import Foundation
@testable import SeadripUtils

enum DateFmtTestError: Error {
    case GotNil
}

@Test func fmtDateOnly() async throws {
    guard let _: Date = try? DtFmtDate.date(from: "2026-02-20") else {
        throw DateFmtTestError.GotNil
    }
}

@Test func fmtTimeOnly() async throws {
    guard let _: Date = try? DtFmtTime.date(from: "17:11:26") else {
        throw DateFmtTestError.GotNil
    }
}

@Test func fmtFullDate() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    guard let _: Date = try? DtFmtFull.date(from: "2026-02-20 17:11:26") else {
        throw DateFmtTestError.GotNil
    }
}
