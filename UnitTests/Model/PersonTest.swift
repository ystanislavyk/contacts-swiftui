//
//  PersonTest.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest

import SwiftUI

@testable import Contacts

class PersonTest: XCTestCase {
    func test_statusToggling() throws {
        let person = Person()
        
        XCTAssertEqual(person.status, Person.Status.online)
        
        person.status.toggle()
        
        XCTAssertEqual(person.status, Person.Status.offline)
        
        person.status.toggle()
        
        XCTAssertEqual(person.status, Person.Status.online)
    }
    
    func test_statusStringRepresentation() throws {
        let person = Person()
        
        XCTAssertEqual(person.status.stringRepresentation(), "online")
        
        person.status.toggle()
        
        XCTAssertEqual(person.status.stringRepresentation(), "offline")
    }
    
    func test_statusColorRepresentation() throws {
        let person = Person()
        
        XCTAssertEqual(person.status.colorRepresentation(), Color.green)
        
        person.status.toggle()
        
        XCTAssertEqual(person.status.colorRepresentation(), Color.gray)
    }
}
