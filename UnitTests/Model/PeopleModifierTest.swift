//
//  PeopleModifierTest.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest

@testable import Contacts

extension Person: Equatable {
    public static func ==(lhs: Person, rhs: Person) -> Bool {
        return (lhs.name == rhs.name) &&
               (lhs.status == rhs.status) &&
               (lhs.email == rhs.email) &&
               (lhs.image == rhs.image)
    }
}

class PeopleModifierTest: XCTestCase {
    private let defaultPerson = Person(name: "John", status: .online, email: "John@email.com", image: UIImage())
    
    private var peopleViewData: PeopleView.Data!
    private var peopleModifier: RealPeopleModifier!
    private var testing_queue: DispatchQueue!

    override func setUp() {
        peopleViewData = PeopleView.Data()
        peopleModifier = RealPeopleModifier(data: peopleViewData)
        testing_queue = DispatchQueue(label: "\(Bundle.main.bundleIdentifier!).testing")
    }
    
    func test_peopleModifier_changeStatusOfPerson() throws {
        testing_queue.async {
            self.peopleModifier.add(person: self.defaultPerson)
            
            DispatchQueue.main.sync {
                XCTAssertFalse(self.peopleViewData.people.isEmpty)
                XCTAssertEqual(self.peopleViewData.people.first!.status, self.defaultPerson.status)
            }
            
            self.peopleModifier.changeStatusOfPerson(with: 0)
            
            DispatchQueue.main.sync {
                XCTAssertEqual(self.peopleViewData.people.first!.status, Person.Status.offline)
            }
        }
    }
    
    func test_peopleModifier_changeNameOfPerson() throws {
        testing_queue.async {
            self.peopleModifier.add(person: self.defaultPerson)
            
            DispatchQueue.main.sync {
                XCTAssertFalse(self.peopleViewData.people.isEmpty)
                XCTAssertEqual(self.peopleViewData.people.first!.name, self.defaultPerson.name)
            }
            
            let newPersonName = "Jane"
            self.peopleModifier.changeNameOfPerson(with: 0, to: newPersonName)
            
            DispatchQueue.main.sync {
                XCTAssertEqual(self.peopleViewData.people.first!.name, newPersonName)
            }
        }
    }

    func test_peopleModifier_addPerson() throws {
        testing_queue.async {
            self.peopleModifier.add(person: self.defaultPerson)
            
            DispatchQueue.main.sync {
                XCTAssertFalse(self.peopleViewData.people.isEmpty)
                XCTAssertEqual(self.peopleViewData.people.first!, self.defaultPerson)
            }
        }
    }
    
    func test_peopleModifier_removePerson() throws {
        testing_queue.async {
            self.peopleModifier.add(person: self.defaultPerson)
            
            DispatchQueue.main.sync {
                XCTAssertFalse(self.peopleViewData.people.isEmpty)
            }
            
            self.peopleModifier.remove(personAt: 0)
            
            DispatchQueue.main.sync {
                XCTAssertTrue(self.peopleViewData.people.isEmpty)
            }
        }
    }
    
    func test_peopleModifier_peopleCount() throws {
        testing_queue.async {
            self.peopleModifier.add(person: self.defaultPerson)
            
            DispatchQueue.main.sync {
                XCTAssertEqual(self.peopleViewData.people.count, 1)
            }
        }
    }

}
