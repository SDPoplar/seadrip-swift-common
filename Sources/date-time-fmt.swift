import SwiftUI

let DateFmtTpl = "yyyy-MM-dd"
let TimeFmtTpl = "hh:mm:ss"

private var _DtFmtFull: DateFormatter {
    let fmt = DateFormatter()
    fmt.dateFormat = "\(DateFmtTpl) \(TimeFmtTpl)"
    return fmt
}

let DtFmtFull = _DtFmtFull

private var _DtFmtDate: DateFormatter {
    let fmt = DateFormatter()
    fmt.dateFormat = DateFmtTpl
    return fmt
}

let DtFmtDate = _DtFmtDate

private var _DtFmtTime: DateFormatter {
    let fmt = DateFormatter()
    fmt.dateFormat = TimeFmtTpl
    return fmt
}

let DtFmtTime = _DtFmtTime
