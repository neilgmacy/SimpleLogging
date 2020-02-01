import Foundation

public enum LogLevel: Int {
    case verbose
    case debug
    case info
    case warn
    case error

    var emojiDescription: String {
        switch self {
        case .verbose:
            return "💬 [VERBOSE]"
        case .debug:
            return "👨‍💻 [DEBUG]"
        case .info:
            return "ℹ️ [INFO]"
        case .warn:
            return "⚠️ [WARNING]"
        case .error:
            return "🛑 [ERROR]"
        }
    }
}

extension LogLevel: Comparable {
    public static func < (lhs: LogLevel, rhs:LogLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
