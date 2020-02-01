import Foundation

public enum LogLevel {
    case verbose
    case debug
    case info
    case warn
    case error

    var emoji: String {
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
