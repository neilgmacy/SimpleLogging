import Foundation

public final class Log {

    /**
     Set the minimum level of priority to log. This is `LogLevel.verbose` by default.

     For example, a `minimumLevel` of `.info` will cause any print calls with a level of `.verbose` or `.debug` to be ignored.

     There's no way to show these filtered-out calls after the fact; `print` calls to a lower level than this `minimumLevel` will be completely ignored.
     */
    public static var minimumLevel: LogLevel = .verbose

    /**
     If you want more detail about where a `print` statement took place, you can log the file and function name. This is `false` by default.
     */
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
        print("\(timeStamp) \(level.emojiDescription): \(message)\(locationSuffix)")
    }

    private static func lastComponent(of file: String) -> String {
        URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent
    }

    /**
     Print a statement to the log.

     This will only be printed if the app is debuggable. Use `releaseLog` to print a statement in release configuration.

     - parameter message: The custom string to log.
     - parameter level: The `LogLevel` at which to record the print statement.
     */
    public static func log(_ message: String, level: LogLevel = .debug, file: String = #file, function: String = #function) {
        #if DEBUG
        printLine(message, level: level, file: file, function: function)
        #endif
    }

    /**
     Print a statement to the log.

     If you want to print a statement that's only recorded in debug mode, use `log` instead.

     - parameter message: The custom string to log.
     - parameter level: The `LogLevel` at which to record the print statement.
     */
    public static func releaseLog(_ message: String, level: LogLevel = .debug, file: String = #file, function: String = #function) {
        printLine(message, level: level, file: file, function: function)
    }
}
