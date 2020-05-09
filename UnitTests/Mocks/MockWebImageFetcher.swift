//
//  MockWebImageFetcher.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

@testable import Contacts

class MockWebImageFetcher: Mock<MockWebImageFetcher.Actions>, WebImageFetcher {
    enum Actions {
        case loadImages
    }
    
    func loadImages(imagesURLs: [String]) -> [UIImage] {
        registerCall(.loadImages)
        return returnValue[.loadImages] as? [UIImage] ?? [UIImage]()
    }
}
