//
//  TestRouterTests.swift
//  TestRouterTests

import XCTest
@testable import TestRouter

class TestRouterTests: XCTestCase {

    func testMySolutionThrowsError() {
        let router = Router()
        XCTAssertThrowsError(try router.mySolution(value: 0), "A Router with 0 value should have been thrown but no Error was thrown") { error in
            if let error = error as? Router.MyError {
                XCTAssertTrue(error.description() == "Parameter 0 is unacceptable")
            } else {
                XCTFail("Error must be MyError type")
            }
        }
    }

    func testMySolutionDoesNotThrowError() {
        let router = Router()
        XCTAssertNoThrow(try router.mySolution(value: 1), "A Router with 1 value should not have been thrown but Error was thrown")
        XCTAssertNoThrow(try router.mySolution(value: 2), "A Router with 1 value should not have been thrown but Error was thrown")
        XCTAssertNoThrow(try router.mySolution(value: 5), "A Router with 1 value should not have been thrown but Error was thrown")
    }
}
