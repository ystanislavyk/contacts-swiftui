//
//  RandomizerTest.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest

@testable import Contacts

class RandomizerTest: XCTestCase {
    private var mockPeopleRepository: MockPeopleRepository!
    private var mockImagesRepository: MockImagesWebRepository!
    private var mockIndexRandomizer: MockIndexRandomizer!
    
    private var randomizer: RealRandomizer!

    override func setUp() {
        mockPeopleRepository = MockPeopleRepository()
        mockImagesRepository = MockImagesWebRepository()
        mockIndexRandomizer = MockIndexRandomizer()
        randomizer = RealRandomizer(peopleRepository: mockPeopleRepository, imagesRepository: mockImagesRepository, indexRandomizer: mockIndexRandomizer)
    }
    
    override func tearDown() {
        mockPeopleRepository.verifyCalls()
        mockImagesRepository.verifyCalls()
    }
    
    func test_randomPersonName() throws {
        var peopleData = PeopleData()
        peopleData.append(PersonData("", ""))
        mockPeopleRepository.returns(value: peopleData, forAction: .loadPeopleData)
        mockPeopleRepository.expectCall(.loadPeopleData)
        mockIndexRandomizer.expectCall(.randomIndex)
        
        XCTAssertNotNil(randomizer.randomPersonName())
    }
    
    func test_randomPersonName_nil() throws {
        mockPeopleRepository.expectCall(.loadPeopleData)
        XCTAssertNil(randomizer.randomPersonName())
    }
    
    func test_randomPersonData() throws {
        var peopleData = PeopleData()
        peopleData.append(PersonData("", ""))
        mockPeopleRepository.returns(value: peopleData, forAction: .loadPeopleData)
        mockPeopleRepository.expectCall(.loadPeopleData)
        mockIndexRandomizer.expectCall(.randomIndex)
        
        XCTAssertNotNil(randomizer.randomPersonData())
    }
    
    func test_randomPersonData_nil() throws {
        mockPeopleRepository.expectCall(.loadPeopleData)
        XCTAssertNil(randomizer.randomPersonData())
    }
    
    func test_randomImage() throws {
        mockImagesRepository.returns(value: [UIImage()], forAction: .load)
        mockImagesRepository.expectCall(.load)
        mockIndexRandomizer.expectCall(.randomIndex)
        
        XCTAssertNotNil(randomizer.randomImage())
    }
    
    func test_randomImage_nil() throws {
        mockImagesRepository.expectCall(.load)
        XCTAssertNil(randomizer.randomImage())
    }
}
