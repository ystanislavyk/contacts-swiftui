//
//  ImagesWebRepository.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest
import SDWebImage

@testable import Contacts

class ImagesWebRepositoryTest: XCTestCase {
    private var mockWebImageFetcher: MockWebImageFetcher!
    
    private var imagesWebRepository: RealImagesWebRepository!

    override func setUp() {
        mockWebImageFetcher = MockWebImageFetcher()
        imagesWebRepository = RealImagesWebRepository(webImagesFetcher: mockWebImageFetcher)
    }
    
    override func tearDown() {
        mockWebImageFetcher.verifyCalls()
    }
    
    func test_load() throws {
        mockWebImageFetcher.expectCall(.loadImages)
        _ = imagesWebRepository.load()
    }
}
