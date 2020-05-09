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
    private let indexRandomizer: IndexRandomizer
    private let randomizer: Randomizer
    
    init(peopleModifier: PeopleModifier, indexRandomizer: IndexRandomizer, randomizer: Randomizer) {
        self.peopleModifier = peopleModifier
        self.indexRandomizer = indexRandomizer
        self.randomizer = randomizer
    }
    
    func randomStatusModification() {
        let peopleCount = peopleModifier.peopleCount()
        guard peopleCount >= 1 else {
            return
        }
        
        peopleModifier.changeStatusOfPerson(with: try! indexRandomizer.randomIndex(limitedBy: peopleCount))
    }
    
    func randomNameModification() {
        let peopleCount = peopleModifier.peopleCount()
        guard peopleCount >= 1 else {
            return
        }
        
        peopleModifier.changeNameOfPerson(with: try! indexRandomizer.randomIndex(limitedBy: peopleCount), to: randomizer.randomPersonName()!)
    }
    
    func randomDeletion() {
        let peopleCount = peopleModifier.peopleCount()
        guard peopleCount >= 1 else {
            return
        }
        
        peopleModifier.remove(personAt: try! indexRandomizer.randomIndex(limitedBy: peopleCount))
    }
    
    func randomAdding() {
        let personData = randomizer.randomPersonData()!
        let personName = personData.0
        let personEmail = personData.1
        let image = randomizer.randomImage()!
        peopleModifier.add(person: Person(name: personName, status: .online, email: personEmail, image: image))
    }
}
