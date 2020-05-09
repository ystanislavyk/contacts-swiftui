//
//  Randomizer.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import UIKit

protocol Randomizer {
    func randomPersonName() -> String?
    func randomPersonData() -> PersonData?
    func randomImage() -> UIImage?
}

class RealRandomizer: Randomizer {
    private let peopleRepository: PeopleRepository
    private let imagesRepository: ImagesWebRepository
    private let indexRandomizer: IndexRandomizer
    
    init(peopleRepository: PeopleRepository, imagesRepository: ImagesWebRepository, indexRandomizer: IndexRandomizer) {
        self.peopleRepository = peopleRepository
        self.imagesRepository = imagesRepository
        self.indexRandomizer = indexRandomizer
    }
    
    func randomPersonName() -> String? {
        let personData = randomPersonData()
        if let personData = personData {
            let personName = personData.0
            return personName
        }
        
        return nil
    }
    
    func randomPersonData() -> PersonData? {
        let peopleData = peopleRepository.loadPeopleData()
        
        guard !peopleData.isEmpty else {
            return nil
        }
        
        let personData = peopleData[try! indexRandomizer.randomIndex(limitedBy: peopleData.count)]
        return personData
    }
    
    func randomImage() -> UIImage? {
        let images = imagesRepository.load()
        
        guard !images.isEmpty else {
            return nil
        }
        
        let image = images[try! indexRandomizer.randomIndex(limitedBy: images.count)]
        return image
    }
}

enum RandomizerError: Error {
    case outOfBounds(String)
}
