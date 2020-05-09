//
//  MockImagesWebRepository.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

@testable import Contacts

class MockImagesWebRepository: Mock<MockImagesWebRepository.Actions>, ImagesWebRepository {
    enum Actions {
        case load
    }
    
    func load() -> [UIImage] {
        registerCall(.load)
        return returnValue[.load] as? [UIImage] ?? [UIImage]()
    }
}
