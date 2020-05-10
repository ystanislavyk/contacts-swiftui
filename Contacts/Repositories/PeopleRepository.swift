//
//  PeopleRepository.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 06.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import Combine
import UIKit

/// A type that represents tuple where 0 is the name of the person and 1 is the email
typealias PersonData = (String, String)

/// A type that represents an array of `PersonData`
typealias PeopleData = [PersonData]

/// The name of the system image 
internal let kSystemImageName = "person.crop.circle"

/// An array of the `PersonData` tuples. Serves as the data source for visual representation of People
fileprivate let testPeopleData: [PersonData] = [("John Wick", "JohnWick@email.com"),
                                                ("Jessica Alba", "JessicaAlba@email.com"),
                                                ("Brad Pitt", "BradPitt@email.com"),
                                                ("Charlize Theron", "CharlizeTheron@email.com"),
                                                ("Kirsten Dunst", "KirstenDunst@email.com"),
                                                ("Angelina Jolie", "AngelinaJolie@email.com"),
                                                ("Ellen Pompeo", "EllenPompeo@email.com"),
                                                ("Christian Bale", "ChristianBale@email.com"),
                                                ("Nicole Kidman", "NicoleKidman@email.com")
                                               ]

/// A type that represents the component for access to People's data
protocol PeopleRepository {
    /// Returns the type erased publisher with wrapped `People` object
    func loadPeople() -> AnyPublisher<People, Error>
    
    /// Returns the `PeopleData` object
    func loadPeopleData() -> PeopleData
}

/// A type that implements the `PeopleRepository` protocol requirements
class RealPeopleRepository: PeopleRepository {
    private let imagesRepository: ImagesWebRepository
    private let indexRandomizer: IndexRandomizer
    
    /// An optional of the `People` type. Caches the loaded People data. Becomes valid after the first `loadPeople` usage during the Application lifecycle
    private var loadedPeople: People?
        
    init(imagesRepository: ImagesWebRepository, indexRandomizer: IndexRandomizer) {
        self.imagesRepository = imagesRepository
        self.indexRandomizer = indexRandomizer
    }
    
    /// Returns the type erased publisher with wrapped `People` object
    /// - Returns: Type erased publisher with wrapped `People` object
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
    
    /// Returns the `PeopleData` object
    /// - Returns: `People`
    func loadPeopleData() -> PeopleData {
        return testPeopleData
    }
    
    /// Returns the `People` object filled with the data from the`testPeopleData` array and system image "person.crop.circle"
    /// - Returns: The `People` object filled with the data and the system image
    private func loadPeopleWithSystemImages() -> People {
        var people = People()
        
        for person in testPeopleData {
            people.append(Person(name: person.0, status: .online, email: person.1, image: UIImage(systemName: kSystemImageName)!))
        }
        
        return people
    }
    
    /// Returns the `People` object filled with the data from the `testPeopleData` array and Gravatar default images
    /// - Parameter gravatarImages: An array of `UIImage` objects containing the Gravatar default images
    /// - Returns: The `People` object filled with data and Gravatar images
    private func loadPeople(with gravatarImages: [UIImage]) -> People {
        var people = People()
        
        for personData in testPeopleData {
            let image = gravatarImages[try! indexRandomizer.randomIndex(limitedBy: gravatarImages.count)]
            people.append(Person(name: personData.0, status: .online, email: personData.1, image: image))
        }
        
        return people
    }
}
