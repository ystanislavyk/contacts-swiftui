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

/// An array of the `String` objects. Represents URLs of the Gravatar default images
private let gravatarDefaultImagesURLs = ["https://www.gravatar.com/avatar/?d=mp",
                                         "https://www.gravatar.com/avatar/?d=identicon",
                                         "https://www.gravatar.com/avatar/?d=monsterid",
                                         "https://www.gravatar.com/avatar/?d=wavatar",
                                         "https://www.gravatar.com/avatar/?d=retro",
                                         "https://www.gravatar.com/avatar/?d=robohash"
                                        ]

/// A type that represents the component for access to Web Images
protocol ImagesWebRepository {
    /// Returns an array of the `UIImage` objects
    func load() -> [UIImage]
}

/// A type that implements the `ImagesWebRepository` protocol requirements
class RealImagesWebRepository: ImagesWebRepository {
    private let webImageFetcher: WebImageFetcher
    
    init(webImagesFetcher: WebImageFetcher) {
        self.webImageFetcher = webImagesFetcher
    }
    
    /// Returns an array of the `UIImage` objects
    /// - Returns: An array of the `UIImage` objects. Each object is a downloaded Gravatar default image
    func load() -> [UIImage] {
        let images = webImageFetcher.loadImages(imagesURLs: gravatarDefaultImagesURLs)
        return images
    }
}
