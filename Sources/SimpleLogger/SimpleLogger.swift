import Foundation

public final class Log {

    public static var minimumLevel: LogLevel = .verbose
    public static var logFileAndFunction = false

    private static var timeStamp: String {
        ISO8601DateFormatter.string(
            from: Date(),
            timeZone: TimeZone.current,
            formatOptions: [.withYear, .withMonth, .withDay, .withDashSeparatorInDate, .withTime, .withColonSeparatorInTime, .withSpaceBetweenDateAndTime]
        )
    }

    private static func printLine(_ message: String, level: LogLevel = .debug, file: String = #file, function: String = #function) {
        guard level >= minimumLevel else {
            return
        }
        let locationSuffix = logFileAndFunction ? " at \(lastComponent(of: file)): \(function)" : ""
        print("\(timeStamp) \(level.emoji): \(message)\(locationSuffix)")
    }

    private static func lastComponent(of file: String) -> String {
        URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent
    }

    public static func log(_ message: String, level: LogLevel = .debug, file: String = #file, function: String = #function) {
        #if DEBUG
        printLine(message, level: level, file: file, function: function)
        #endif
    }

    public static func releaseLog(_ message: String, level: LogLevel = .debug, file: String = #file, function: String = #function) {
        printLine(message, level: level, file: file, function: function)
    }
}
