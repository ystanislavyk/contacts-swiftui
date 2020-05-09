//
//  PeopleRandomizerTest.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest

@testable import Contacts

class PeopleRandomizerTest: XCTestCase {
    private var mockPeopleModificationRandomizer: MockPeopleModificationRandomizer!
    private var mockIndexRandomizer: MockIndexRandomizer!
    private var queuesHolder: QueuesHolder!
    private var peopleRandomizer: RealPeopleRandomizer!
    
    override func setUp() {
        mockPeopleModificationRandomizer = MockPeopleModificationRandomizer()
        mockIndexRandomizer = MockIndexRandomizer()
        queuesHolder = RealQueuesHolder()
        peopleRandomizer = RealPeopleRandomizer(indexRandomizer: mockIndexRandomizer, peopleModificationRandomizer: mockPeopleModificationRandomizer, queuesHolder: queuesHolder)
    }
    
    override func tearDown() {
        mockPeopleModificationRandomizer.verifyCalls()
        mockIndexRandomizer.verifyCalls()
    }
    
    func test_randomize() throws {
        mockIndexRandomizer.expectCallAtLeastOnce(.randomIndex)
        mockPeopleModificationRandomizer.expectCallAtLeastOnce(.randomAdding)
        mockPeopleModificationRandomizer.expectCallAtLeastOnce(.randomDeletion)
        mockPeopleModificationRandomizer.expectCallAtLeastOnce(.randomNameModification)
        mockPeopleModificationRandomizer.expectCallAtLeastOnce(.randomStatusModification)
        
        peopleRandomizer.randomize()
    }
    
    func test_randomizeTimes() throws {
        mockIndexRandomizer.expectCallAtLeastOnce(.randomIndex)
        mockPeopleModificationRandomizer.expectCallAtLeastOnce(.randomAdding)
        mockPeopleModificationRandomizer.expectCallAtLeastOnce(.randomDeletion)
        mockPeopleModificationRandomizer.expectCallAtLeastOnce(.randomNameModification)
        mockPeopleModificationRandomizer.expectCallAtLeastOnce(.randomStatusModification)
        
        peopleRandomizer.randomize(times: 1, withInterval: 0.1)
        queuesHolder.randomizationQueue().sync {}
    }

}
