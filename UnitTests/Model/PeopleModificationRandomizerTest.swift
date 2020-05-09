//
//  PeopleModificationRandomizerTest.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest

@testable import Contacts

class PeopleModificationRandomizerTest: XCTestCase {
    private var mockPeopleModifier: MockPeopleModifier!
    private var mockIndexRandomizer: MockIndexRandomizer!
    private var mockRandomizer: MockRandomizer!
    
    private var peopleModificationRandomizer: RealPeopleModificationRandomizer!

    override func setUp() {
        mockPeopleModifier = MockPeopleModifier()
        mockIndexRandomizer = MockIndexRandomizer()
        mockRandomizer = MockRandomizer()
        
        peopleModificationRandomizer = RealPeopleModificationRandomizer(peopleModifier: mockPeopleModifier, indexRandomizer: mockIndexRandomizer, randomizer: mockRandomizer)
    }
    
    override func tearDown() {
        mockPeopleModifier.verifyCalls()
        mockRandomizer.verifyCalls()
    }
    
    func test_randomStatusModification_called() throws {
        mockIndexRandomizer.expectCall(.randomIndex)
        mockPeopleModifier.returns(value: 1, forAction: .peopleCount)
        mockPeopleModifier.expectCall(.peopleCount)
        mockPeopleModifier.expectCall(.changeStatusOfPerson)
        
        peopleModificationRandomizer.randomStatusModification()
    }
    
    func test_randomStatusModification_notCalled() throws {
        mockPeopleModifier.returns(value: 0, forAction: .peopleCount)
        mockPeopleModifier.expectCall(.peopleCount)
        
        peopleModificationRandomizer.randomStatusModification()
    }
    
    func test_randomNameModification_called() throws {
        mockIndexRandomizer.expectCall(.randomIndex)
        mockRandomizer.expectCall(.randomPersonName)
        mockPeopleModifier.returns(value: 1, forAction: .peopleCount)
        mockPeopleModifier.expectCall(.peopleCount)
        mockPeopleModifier.expectCall(.changeNameOfPerson)
        
        peopleModificationRandomizer.randomNameModification()
    }
    
    func test_randomNameModification_notCalled() throws {        
        mockPeopleModifier.returns(value: 0, forAction: .peopleCount)
        mockPeopleModifier.expectCall(.peopleCount)
        
        peopleModificationRandomizer.randomNameModification()
    }
    
    func test_randomDeletion_called() throws {
        mockIndexRandomizer.expectCall(.randomIndex)
        mockPeopleModifier.returns(value: 1, forAction: .peopleCount)
        mockPeopleModifier.expectCall(.peopleCount)
        mockPeopleModifier.expectCall(.removePersonAtIndex)
        
        peopleModificationRandomizer.randomDeletion()
    }
    
    func test_randomDeletion_notCalled() throws {
        mockPeopleModifier.returns(value: 0, forAction: .peopleCount)
        mockPeopleModifier.expectCall(.peopleCount)
        
        peopleModificationRandomizer.randomDeletion()
    }
    
    func test_randomAdding() throws {
        mockRandomizer.expectCall(.randomPersonData)
        mockRandomizer.expectCall(.randomImage)
        mockPeopleModifier.expectCall(.addPerson)
        
        peopleModificationRandomizer.randomAdding()
    }

}
