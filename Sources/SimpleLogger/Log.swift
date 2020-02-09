import Foundation

public final class Log {

    // MARK: - Public properties

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

    // MARK: - Private properties

    private static var timeStamp: String {
        ISO8601DateFormatter.string(
            from: Date(),
            timeZone: TimeZone.current,
            formatOptions: [.withYear, .withMonth, .withDay, .withDashSeparatorInDate, .withTime, .withColonSeparatorInTime, .withSpaceBetweenDateAndTime]
        )
    }

    // MARK: - Public methods

    /**
     Log a message at level `LogLevel.verbose`.

     - parameter message: The message to record.
     - parameter includeInRelease: `true` if you want this to be included in release builds.
     */
    public static func verbose(_ message: String, includeInRelease: Bool = false, file: String = #file, function: String = #function) {
        log(message, level: .verbose, includeInRelease: includeInRelease, file: file, function: function)
    }

    /**
     Log a message at level `LogLevel.debug`.

     - parameter message: The message to record.
     - parameter includeInRelease: `true` if you want this to be included in release builds.
     */
    public static func debug(_ message: String, includeInRelease: Bool = false, file: String = #file, function: String = #function) {
        log(message, level: .debug, includeInRelease: includeInRelease, file: file, function: function)
    }

    /**
     Log a message at level `LogLevel.info`.

     - parameter message: The message to record.
     - parameter includeInRelease: `true` if you want this to be included in release builds.
     */
    public static func info(_ message: String, includeInRelease: Bool = false, file: String = #file, function: String = #function) {
        log(message, level: .info, includeInRelease: includeInRelease, file: file, function: function)
    }

    /**
     Log a message at level `LogLevel.warn`.

     - parameter message: The message to record.
     - parameter includeInRelease: `true` if you want this to be included in release builds.
     */
    public static func warn(_ message: String, includeInRelease: Bool = false, file: String = #file, function: String = #function) {
        log(message, level: .warn, includeInRelease: includeInRelease, file: file, function: function)
    }

    /**
     Log a message at level `LogLevel.error`.

     - parameter message: The message to record.
     - parameter includeInRelease: `true` if you want this to be included in release builds.
     */
    public static func error(_ message: String, includeInRelease: Bool = false, file: String = #file, function: String = #function) {
        log(message, level: .error, includeInRelease: includeInRelease, file: file, function: function)
    }

    // MARK: - Private methods

    private static func log(_ message: String, level: LogLevel, includeInRelease: Bool, file: String = #file, function: String = #function) {
        guard let message = getLogMessage(message, level: level, file: file, function: function) else {
            return
        }

        if includeInRelease {
            print(message)
            return
        }

        #if DEBUG
        print(message)
        #endif
    }

    internal static func getLogMessage(_ message: String, level: LogLevel, includeTimeStamp: Bool = true, file: String = #file, function: String = #function) -> String? {
        guard level >= minimumLevel else {
            return nil
        }

        let timeStampPrefix = includeTimeStamp ? "\(timeStamp) " : ""
        let locationSuffix = logFileAndFunction ? " at \(lastComponent(of: file)): \(function)" : ""
        return "\(timeStampPrefix)\(level.emojiDescription): \(message)\(locationSuffix)"
    }

    private static func lastComponent(of file: String) -> String {
        URL(fileURLWithPath: file).deletingPathExtension().lastPathComponent
    }
}
