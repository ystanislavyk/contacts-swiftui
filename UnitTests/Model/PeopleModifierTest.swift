//
//  PeopleModifierTest.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest

@testable import Contacts

class PeopleModifierTest: XCTestCase {
    private var peopleViewData: PeopleView.Data!
    private var peopleModifier: RealPeopleModifier!
    private var testingQueue: DispatchQueue!

    override func setUp() {
        peopleViewData = PeopleView.Data()
        peopleModifier = RealPeopleModifier(data: peopleViewData)
        testingQueue = DispatchQueue(label: "\(Bundle.main.bundleIdentifier!).testing")
    }
    
    func test_peopleModifier_changeStatusOfPerson() throws {
        testingQueue.async {
            self.peopleModifier.add(person: defaultPerson)
            
            DispatchQueue.main.sync {
                XCTAssertFalse(self.peopleViewData.people.isEmpty)
                XCTAssertEqual(self.peopleViewData.people.first!.status, defaultPerson.status)
            }
            
            self.peopleModifier.changeStatusOfPerson(with: 0)
            
            DispatchQueue.main.sync {
                XCTAssertEqual(self.peopleViewData.people.first!.status, Person.Status.offline)
            }
        }
    }
    
    func test_peopleModifier_changeStatusOfPerson_notChanged() throws {
        testingQueue.async {
            DispatchQueue.main.sync {
                XCTAssertTrue(self.peopleViewData.people.isEmpty)
            }
            
            self.peopleModifier.changeStatusOfPerson(with: 0)
        }
    }
    
    func test_peopleModifier_changeNameOfPerson() throws {
        testingQueue.async {
            self.peopleModifier.add(person: defaultPerson)
            
            DispatchQueue.main.sync {
                XCTAssertFalse(self.peopleViewData.people.isEmpty)
                XCTAssertEqual(self.peopleViewData.people.first!.name, defaultPerson.name)
            }
            
            let newPersonName = "Jane"
            self.peopleModifier.changeNameOfPerson(with: 0, to: newPersonName)
            
            DispatchQueue.main.sync {
                XCTAssertEqual(self.peopleViewData.people.first!.name, newPersonName)
            }
        }
    }
    
    func test_peopleModifier_changeNameOfPerson_notChanged() throws {
        testingQueue.async {
            DispatchQueue.main.sync {
                XCTAssertTrue(self.peopleViewData.people.isEmpty)
            }
            
            let newPersonName = "Jane"
            self.peopleModifier.changeNameOfPerson(with: 0, to: newPersonName)
        }
    }

    func test_peopleModifier_addPerson() throws {
        testingQueue.async {
            self.peopleModifier.add(person: defaultPerson)
            
            DispatchQueue.main.sync {
                XCTAssertFalse(self.peopleViewData.people.isEmpty)
                XCTAssertEqual(self.peopleViewData.people.first!, defaultPerson)
            }
        }
    }
    
    func test_peopleModifier_removePerson() throws {
        testingQueue.async {
            self.peopleModifier.add(person: defaultPerson)
            
            DispatchQueue.main.sync {
                XCTAssertFalse(self.peopleViewData.people.isEmpty)
            }
            
            self.peopleModifier.remove(personAt: 0)
            
            DispatchQueue.main.sync {
                XCTAssertTrue(self.peopleViewData.people.isEmpty)
            }
        }
    }
    
    func test_peopleModifier_removePerson_notRemoved() throws {
        testingQueue.async {
            DispatchQueue.main.sync {
                XCTAssertTrue(self.peopleViewData.people.isEmpty)
            }
            
            self.peopleModifier.remove(personAt: 0)
        }
    }
    
    func test_peopleModifier_peopleCount() throws {
        testingQueue.async {
            self.peopleModifier.add(person: defaultPerson)
            
            DispatchQueue.main.sync {
                XCTAssertEqual(self.peopleModifier.peopleCount(), 1)
            }
        }
    }

}
