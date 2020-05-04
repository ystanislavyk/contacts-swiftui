//
//  MockPeopleModifier.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

@testable import Contacts

class MockPeopleModifier: Mock<MockPeopleModifier.Actions>, PeopleModifier {
    enum Actions {
        case changeStatusOfPerson
        case changeNameOfPerson
        case addPerson
        case removePersonAtIndex
        case peopleCount
    }
    
    func changeStatusOfPerson(with index: Int) {
        registerCall(.changeStatusOfPerson)
    }
    
    func changeNameOfPerson(with index: Int, to newName: String) {
        registerCall(.changeNameOfPerson)
    }
    
    func add(person: Person) {
        registerCall(.addPerson)
    }
    
    func remove(personAt index: Int) {
        registerCall(.removePersonAtIndex)
    }
    
    func peopleCount() -> Int {
        registerCall(.peopleCount)
        return 0
    }
}
