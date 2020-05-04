//
//  PeopleModificationRandomizer.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

protocol PeopleModificationRandomizer {
    func randomStatusModification()
    func randomNameModification()
    func randomDeletion()
    func randomAdding()
}

class RealPeopleModificationRandomizer: PeopleModificationRandomizer {
    private let peopleModifier: PeopleModifier
    private let peopleRepository: PeopleRepository
    private let imagesRepository: ImagesWebRepository
    
    init(peopleModifier: PeopleModifier, peopleRepository: PeopleRepository, imagesRepository: ImagesWebRepository) {
        self.peopleModifier = peopleModifier
        self.peopleRepository = peopleRepository
        self.imagesRepository = imagesRepository
    }
    
    func randomStatusModification() {
        peopleModifier.changeStatusOfPerson(with: randomIndex(limitedBy: peopleModifier.peopleCount()))
    }
    
    func randomNameModification() {
        peopleModifier.changeNameOfPerson(with: randomIndex(limitedBy: peopleModifier.peopleCount()), to: randomPersonName())
    }
    
    func randomDeletion() {
        peopleModifier.remove(personAt: randomIndex(limitedBy: peopleModifier.peopleCount()))
    }
    
    func randomAdding() {
        let personData = randomPersonData()
        let personName = personData.0
        let personEmail = personData.1
        let image = randomImage()
        peopleModifier.add(person: Person(name: personName, status: .online, email: personEmail, image: image))
    }
    
    private func randomPersonName() -> String {
        let personData = randomPersonData()
        let personName = personData.0
        return personName
    }
    
    private func randomPersonData() -> PersonData {
        let peopleData = peopleRepository.loadPeopleData()
        
        // Strange. Better to avoid call to a randomPersonData() if we don't have data at all
        guard !peopleData.isEmpty else {
            return PersonData("", "")
        }
        
        let personData = peopleData[randomIndex(limitedBy: peopleData.count)]
        return personData
    }
    
    private func randomImage() -> UIImage {
        let images = imagesRepository.load()
        
        // Strange. Better to avoid call to a randomImage() if we don't have data at all
        guard !images.isEmpty else {
            return UIImage()
        }
        
        let image = images[randomIndex(limitedBy: images.count)]
        return image
    }
}
