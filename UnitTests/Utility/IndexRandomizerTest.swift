//
//  IndexRandomizerTest.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest

@testable import Contacts

class IndexRandomizerTest: XCTestCase {
    private var indexRandomizer: RealIndexRandomizer!
    
    override func setUp() {
        indexRandomizer = RealIndexRandomizer()
    }
    
    func test_randomIndex_emptyArray_throwsError() throws {
        let array = [Int]()
        XCTAssertThrowsError(try array[indexRandomizer.randomIndex(limitedBy: array.count)])
    }

    func test_randomIndex_filledArray_NoThrow() throws {
        let array = [1, 2, 3, 4, 5]
        XCTAssertNoThrow(try array[indexRandomizer.randomIndex(limitedBy: array.count)])
    }

    func test_randomIndex_correctRandomIndex() throws {
        let array = [1, 2, 3, 4, 5]

        for _ in array {
            let index = try! array[indexRandomizer.randomIndex(limitedBy: array.count)]
            XCTAssertTrue((index >= array.startIndex && index <= array.endIndex))
        }
    }
}
