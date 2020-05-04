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
    func load() -> [UIImage] {
        let dispatchGroup = DispatchGroup()
        let webImageManager = SDWebImageManager()
        
        var images = [UIImage]()
        
        for url in gravatarDefaultImagesURLs {
            dispatchGroup.enter()
            webImageManager.loadImage(with: URL(string: url), options: SDWebImageOptions(rawValue: 0), progress: nil, completed: { image, error ,_,_,_,_ in
                if let image = image {
                    images.append(image)
                }
                dispatchGroup.leave()
            })
            dispatchGroup.wait()
        }
        
        return images
    }
}
