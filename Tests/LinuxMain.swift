import XCTest

import SimpleLoggingTests

var tests = [XCTestCaseEntry]()
tests += LogTests.allTests()
tests += LogLevelTests.allTests()
XCTMain(tests)
