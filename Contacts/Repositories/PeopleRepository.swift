//
//  PeopleRepository.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 06.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import Combine
import UIKit

typealias PersonData = (String, String)
typealias PeopleData = [PersonData]

let testPeopleData = [("John Wick", "JohnWick@email.com"),
                      ("Jessica Alba", "JessicaAlba@email.com"),
                      ("Brad Pitt", "BradPitt@email.com"),
                      ("Charlize Theron", "CharlizeTheron@email.com"),
                      ("Kirsten Dunst", "KirstenDunst@email.com"),
                      ("Angelina Jolie", "AngelinaJolie@email.com"),
                      ("Ellen Pompeo", "EllenPompeo@email.com"),
                      ("Christian Bale", "ChristianBale@email.com"),
                      ("Nicole Kidman", "NicoleKidman@email.com")
                     ]

protocol PeopleRepository {
    func loadPeople() -> AnyPublisher<People, Error>
    func loadPeopleData() -> PeopleData
}

class RealPeopleRepository: PeopleRepository {
    private let imagesRepository: ImagesWebRepository
    
    private var loadedPeople: People?
        
    init(imagesRepository: ImagesWebRepository) {
        self.imagesRepository = imagesRepository
    }
    
    func loadPeople() -> AnyPublisher<People, Error> {
        Future<People, Error> { promise in
            guard self.loadedPeople == nil else {
                return promise(.success(self.loadedPeople!))
            }
            
            let gravatarImages = self.imagesRepository.load()
            
            let people: People
            if gravatarImages.isEmpty {
                people = self.loadPeopleWithSystemImages()
                // TODO: Add handling in case of missing images from the web
                //promise(.failure)
            } else {
                people = self.loadPeople(with: gravatarImages)
            }
            
            self.loadedPeople = people
            promise(.success(people))
        }
        .eraseToAnyPublisher()
    }
    
    func loadPeopleData() -> PeopleData {
        return testPeopleData
    }
    
    private func loadPeopleWithSystemImages() -> People {
        var people = People()
        
        for person in testPeopleData {
            people.append(Person(name: person.0, status: .online, email: person.1, image: UIImage(systemName: "person.crop.circle")!))
        }
        
        return people
    }
    
    private func loadPeople(with gravatarImages: [UIImage]) -> People {
        var people = People()
        
        for personData in testPeopleData {
            let image = gravatarImages[randomIndex(limitedBy: gravatarImages.count)]
            people.append(Person(name: personData.0, status: .online, email: personData.1, image: image))
        }
        
        return people
    }
}
