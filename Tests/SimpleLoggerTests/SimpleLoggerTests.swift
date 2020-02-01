import XCTest
@testable import SimpleLogger

final class SimpleLoggerTests: XCTestCase {

    func testVerboseLessThanAllOtherLevels() {
        XCTAssertTrue(LogLevel.verbose < LogLevel.debug)
        XCTAssertTrue(LogLevel.verbose < LogLevel.info)
        XCTAssertTrue(LogLevel.verbose < LogLevel.warn)
        XCTAssertTrue(LogLevel.verbose < LogLevel.error)
    }

    func testDebugLessThanInfoWarnAndError() {
        XCTAssertTrue(LogLevel.debug < LogLevel.info)
        XCTAssertTrue(LogLevel.debug < LogLevel.warn)
        XCTAssertTrue(LogLevel.debug < LogLevel.error)
    }

    func testInfoLessThanWarnAndError() {
        XCTAssertTrue(LogLevel.info < LogLevel.warn)
        XCTAssertTrue(LogLevel.info < LogLevel.error)
    }

    func testWarnLessThanError() {
        XCTAssertTrue(LogLevel.warn < LogLevel.error)
    }

    static var allTests = [
        ("testVerboseLessThanAllOtherLevels", testVerboseLessThanAllOtherLevels),
        ("testDebugLessThanInfoWarnAndError", testDebugLessThanInfoWarnAndError),
        ("testInfoLessThanWarnAndError", testInfoLessThanWarnAndError),
        ("testWarnLessThanError", testWarnLessThanError)
    ]
}
