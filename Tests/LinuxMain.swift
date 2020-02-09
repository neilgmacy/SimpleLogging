import XCTest

import SimpleLoggerTests

var tests = [XCTestCaseEntry]()
tests += LogTests.allTests()
tests += LogLevelTests.allTests()
XCTMain(tests)
