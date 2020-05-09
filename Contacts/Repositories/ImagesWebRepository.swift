//
//  ImagesWebRepository.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 06.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import Combine
import UIKit
import SDWebImage

private let gravatarDefaultImagesURLs = ["https://www.gravatar.com/avatar/?d=mp",
                                         "https://www.gravatar.com/avatar/?d=identicon",
                                         "https://www.gravatar.com/avatar/?d=monsterid",
                                         "https://www.gravatar.com/avatar/?d=wavatar",
                                         "https://www.gravatar.com/avatar/?d=retro",
                                         "https://www.gravatar.com/avatar/?d=robohash"
                                        ]

protocol ImagesWebRepository {
    func load() -> [UIImage]
}

class RealImagesWebRepository: ImagesWebRepository {
    private let webImageFetcher: WebImageFetcher
    
    init(webImagesFetcher: WebImageFetcher) {
        self.webImageFetcher = webImagesFetcher
    }
    
    func load() -> [UIImage] {
        let images = webImageFetcher.loadImages(imagesURLs: gravatarDefaultImagesURLs)
        return images
    }
}
