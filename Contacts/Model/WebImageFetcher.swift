//
//  WebImagesFetcher.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import Foundation
import SwiftUI

import SDWebImage

protocol WebImageFetcher {
    func loadImages(imagesURLs: [String]) -> [UIImage]
}

class RealWebImageFetcher: WebImageFetcher {
    func loadImages(imagesURLs: [String]) -> [UIImage] {
        let webImageManager = SDWebImageManager()
        let dispatchGroup = DispatchGroup()
        
        var images = [UIImage]()
        
        for url in imagesURLs {
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
