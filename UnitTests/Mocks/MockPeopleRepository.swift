//
//  MockPeopleRepository.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import Combine

@testable import Contacts

class MockPeopleRepository: Mock<MockPeopleRepository.Actions>, PeopleRepository {
    enum Actions {
        case loadPeople
        case loadPeopleData
    }
    
    func loadPeople() -> AnyPublisher<People, Error> {
        registerCall(.loadPeople)
        return Future<People, Error> { _ in }.eraseToAnyPublisher()
    }
    
    func loadPeopleData() -> PeopleData {
        registerCall(.loadPeopleData)
        return PeopleData()
    }
}
