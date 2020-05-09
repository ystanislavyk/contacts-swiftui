//
//  MockIndexRandomizer.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

@testable import Contacts

class MockIndexRandomizer: Mock<MockIndexRandomizer.Actions>, IndexRandomizer {
    enum Actions {
        case randomIndex
    }
    
    func randomIndex(limitedBy elementsCount: Int) throws -> Int {
        registerCall(.randomIndex)
        return returnValue[.randomIndex] as? Int ?? 0
    }
}
