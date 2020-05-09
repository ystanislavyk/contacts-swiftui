//
//  PeopleInteractorTest.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest

import SwiftUI

@testable import Contacts

class PeopleInteractorTest: XCTestCase {
    private var mockPeopleRepository: MockPeopleRepository!
    private var mockPeopleRandomizer: MockPeopleRandomizer!
    private var queuesHolder: RealQueuesHolder!
    private var peopleInteractor: RealPeopleInteractor!

    override func setUp() {
        mockPeopleRepository = MockPeopleRepository()
        mockPeopleRandomizer = MockPeopleRandomizer()
        queuesHolder = RealQueuesHolder()
        peopleInteractor = RealPeopleInteractor(peopleRepository: mockPeopleRepository, peopleRandomizer: mockPeopleRandomizer, queuesHolder: queuesHolder)
    }
    
    override func tearDown() {
        mockPeopleRepository.verifyCalls()
        mockPeopleRandomizer.verifyCalls()
    }
    
    func test_load() throws {
        mockPeopleRepository.expectCall(.loadPeople)
        
        peopleInteractor.load(peopleList: .constant(People()))
        queuesHolder.backgroundQueue().sync {}
    }
    
    func test_randomize() throws {
        mockPeopleRandomizer.expectCall(.randomize)
        
        peopleInteractor.randomize()
        queuesHolder.backgroundQueue().sync {}
    }
    
    func test_randomize_times() throws {
        mockPeopleRandomizer.expectCall(.randomizeTimesWithInterval)
        
        peopleInteractor.randomize(times: 1, withInterval: 0.1)
        queuesHolder.backgroundQueue().sync {}
    }
}
