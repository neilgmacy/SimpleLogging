import XCTest
@testable import SimpleLogging

final class LogTests: XCTestCase {

    static var allTests = [
        ("test_getLogMessage_when_minimum_level_lower_than_log_level_return_nil", test_getLogMessage_when_minimum_level_lower_than_log_level_return_nil),
        ("test_getLogMessage_when_minimum_level_same_as_log_level_return_message", test_getLogMessage_when_minimum_level_same_as_log_level_return_message),
        ("test_getLogMessage_when_minimum_level_higher_than_log_level_return_message", test_getLogMessage_when_minimum_level_higher_than_log_level_return_message),
        ("test_getLogMessage_when_logFileAndFunction_is_true_include_file_and_function_metadata", test_getLogMessage_when_logFileAndFunction_is_true_include_file_and_function_metadata)
    ]

    // MARK: - test minimumLevel

    func test_getLogMessage_when_minimum_level_lower_than_log_level_return_nil() {
        Log.minimumLevel = .info
        Log.logFileAndFunction = false

        let observedMessage = Log.getLogMessage("Test message", level: .debug)

        let expectedMessage: String? = nil
        XCTAssertEqual(expectedMessage, observedMessage)
    }

    func test_getLogMessage_when_minimum_level_same_as_log_level_return_message() {
        Log.minimumLevel = .info
        Log.logFileAndFunction = false

        let observedMessage = Log.getLogMessage("Test message", level: .info, includeTimeStamp: false)

        let expectedMessage = "ℹ️ [INFO]: Test message"
        XCTAssertEqual(expectedMessage, observedMessage)
    }

    func test_getLogMessage_when_minimum_level_higher_than_log_level_return_message() {
        Log.minimumLevel = .info
        Log.logFileAndFunction = false

        let observedMessage = Log.getLogMessage("Test message", level: .warn, includeTimeStamp: false)

        let expectedMessage = "⚠️ [WARNING]: Test message"
        XCTAssertEqual(expectedMessage, observedMessage)
    }

    // MARK: - test logFileAndFunction

    func test_getLogMessage_when_logFileAndFunction_is_true_include_file_and_function_metadata() {
        Log.minimumLevel = .debug
        Log.logFileAndFunction = true

        let observedMessage = Log.getLogMessage("Test message", level: .info, includeTimeStamp: false)

        let expectedMessage = "ℹ️ [INFO]: Test message at LogTests: test_getLogMessage_when_logFileAndFunction_is_true_include_file_and_function_metadata()"
        XCTAssertEqual(expectedMessage, observedMessage)
    }
}
