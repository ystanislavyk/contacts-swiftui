//
//  PeopleRepositoryTest.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest

@testable import Contacts

class PeopleRepositoryTest: XCTestCase {
    /// The count of elements in the `testPeopleData` array from the `PeopleRepository`
    /// Should be replaced in future by something more appropriate
    private let testPeopleDataCount: UInt = 9
    
    private var mockImagesRepository: MockImagesWebRepository!
    private var mockIndexRandomizer: MockIndexRandomizer!
    private var peopleRepository: RealPeopleRepository!
    private var testingQueue: DispatchQueue!

    override func setUp() {
        mockImagesRepository = MockImagesWebRepository()
        mockIndexRandomizer = MockIndexRandomizer()
        peopleRepository = RealPeopleRepository(imagesRepository: mockImagesRepository, indexRandomizer: mockIndexRandomizer)
        testingQueue = DispatchQueue(label: "\(Bundle.main.bundleIdentifier!).testing")
    }
    
    override func tearDown() {
        mockImagesRepository.verifyCalls()
    }
    
    func test_loadPeople_peopleWithGravatarImagesLoaded() throws {
        mockIndexRandomizer.expectCall(.randomIndex, times: testPeopleDataCount)
        mockImagesRepository.returns(value: [UIImage()], forAction: .load)
        mockImagesRepository.expectCall(.load)
        
        let people = loadPeople()
        
        XCTAssertFalse(people.isEmpty)
        XCTAssertNotEqual(people.first!.image, UIImage(systemName: systemImageName))
    }
    
    func test_loadPeople_peopleWithSystemImagesLoaded() throws {
        mockImagesRepository.returns(value: [UIImage](), forAction: .load)
        mockImagesRepository.expectCall(.load)
        
        let people = loadPeople()
        
        XCTAssertFalse(people.isEmpty)
        XCTAssertEqual(people.first!.image, UIImage(systemName: systemImageName))
    }
    
    func test_loadPeople_cachedPeopleLoaded() throws {
        mockImagesRepository.returns(value: [UIImage](), forAction: .load)
        mockImagesRepository.expectCall(.load)
        
        let people = loadPeople()
        
        XCTAssertFalse(people.isEmpty)
        
        let cachedPeople = loadPeople()
        
        XCTAssertEqual(people, cachedPeople)
    }
    
    func test_loadPeopleData() throws {
        XCTAssertFalse(peopleRepository.loadPeopleData().isEmpty)
    }
    
    private func loadPeople() -> People {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        var people = People()
        
        testingQueue.async {
            _ = self.peopleRepository.loadPeople().sink(receiveCompletion: {_ in}, receiveValue: { value in
                people = value
                dispatchGroup.leave()
            })
        }
        dispatchGroup.wait()
        
        XCTAssertFalse(people.isEmpty)
        
        return people
    }

}
