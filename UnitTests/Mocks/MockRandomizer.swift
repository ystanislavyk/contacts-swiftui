//
//  MockRandomizer.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import UIKit

@testable import Contacts

class MockRandomizer: Mock<MockRandomizer.Actions>, Randomizer {
    enum Actions {
        case randomPersonName
        case randomPersonData
        case randomImage
    }
    
    func randomPersonName() -> String? {
        registerCall(.randomPersonName)
        return returnValue[.randomPersonName] as? String ?? String()
    }
    
    func randomPersonData() -> PersonData? {
        registerCall(.randomPersonData)
        return returnValue[.randomPersonName] as? PersonData ?? PersonData("", "")
    }
    
    func randomImage() -> UIImage? {
        registerCall(.randomImage)
        return returnValue[.randomPersonName] as? UIImage ?? UIImage()
    }
}
