//
//  MockPeopleInteractor.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

@testable import Contacts

import SwiftUI

class MockPeopleInteractor: Mock<MockPeopleInteractor.Actions>, PeopleInteractor {
    enum Actions {
        case loadPeopleList
        case randomize
        case randomizeTimesWithInterval
    }
    
    func load(peopleList: Binding<People>) {
        registerCall(.loadPeopleList)
    }
    
    func randomize() {
        registerCall(.randomize)
    }
    
    func randomize(times: Int, withInterval interval: TimeInterval) {
        registerCall(.randomizeTimesWithInterval)
    }
}
