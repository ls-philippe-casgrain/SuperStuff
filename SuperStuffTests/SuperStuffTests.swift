//
//  SuperStuffTests.swift
//  SuperStuffTests
//

import XCTest
@testable import SuperStuff

class SuperStuffTests: XCTestCase {

    func testPersonFileLoadingPerformance() throws {
        // This is an example of a performance test case.
        measure {
            let people = PeopleStore.people
            let expectedCount = 11351
            XCTAssertEqual(expectedCount, people.count)
        }
    }

}
