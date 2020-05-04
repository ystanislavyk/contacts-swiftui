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
    private var mockPeopleRepository: MockPeopleRepository!
    private var mockImagesWebRepository: MockImagesWebRepository!
    
    private var peopleModificationRandomizer: RealPeopleModificationRandomizer!

    override func setUp() {
        mockPeopleModifier = MockPeopleModifier()
        mockPeopleRepository = MockPeopleRepository()
        mockImagesWebRepository = MockImagesWebRepository()
        
        peopleModificationRandomizer = RealPeopleModificationRandomizer(peopleModifier: mockPeopleModifier!, peopleRepository: mockPeopleRepository!, imagesRepository: mockImagesWebRepository!)
    }
    
    override func tearDown() {
        mockPeopleModifier.verifyAllCalls()
    }
    
    func test_randomStatusModification() throws {
        mockPeopleModifier.expectCall(.peopleCount)
        mockPeopleModifier.expectCall(.changeStatusOfPerson)
        
        peopleModificationRandomizer.randomStatusModification()
    }
    
    func test_randomNameModification() throws {
        mockPeopleRepository.expectCall(.loadPeopleData)
        
        mockPeopleModifier.expectCall(.peopleCount)
        mockPeopleModifier.expectCall(.changeNameOfPerson)
        
        peopleModificationRandomizer.randomNameModification()
    }
    
    func test_randomDeletion() throws {
        mockPeopleModifier.expectCall(.peopleCount)
        mockPeopleModifier.expectCall(.removePersonAtIndex)
        
        peopleModificationRandomizer.randomDeletion()
    }
    
    func test_randomAdding() throws {
        mockPeopleRepository.expectCall(.loadPeopleData)
        mockImagesWebRepository.expectCall(.load)
        mockPeopleModifier.expectCall(.addPerson)
        
        peopleModificationRandomizer.randomAdding()
    }

}
