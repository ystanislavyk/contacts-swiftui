//
//  MockPeopleRandomizer.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

@testable import Contacts

import Foundation

class MockPeopleRandomizer: Mock<MockPeopleRandomizer.Actions>, PeopleRandomizer {
    enum Actions {
        case randomize
        case randomizeTimesWithInterval
    }
    
    func randomize() {
        registerCall(.randomize)
    }
    
    func randomize(times: Int, withInterval interval: TimeInterval) {
        registerCall(.randomizeTimesWithInterval)
    }
}
