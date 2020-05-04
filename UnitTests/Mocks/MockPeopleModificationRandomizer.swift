//
//  MockPeopleModificationRandomizer.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

@testable import Contacts

class MockPeopleModificationRandomizer: Mock<MockPeopleModificationRandomizer.Actions>, PeopleModificationRandomizer {
    enum Actions {
        case randomStatusModification
        case randomNameModification
        case randomDeletion
        case randomAdding
    }
    
    func randomStatusModification() {
        registerCall(.randomStatusModification)
    }
    
    func randomNameModification() {
        registerCall(.randomNameModification)
    }
    
    func randomDeletion() {
        registerCall(.randomDeletion)
    }
    
    func randomAdding() {
        registerCall(.randomAdding)
    }
}
