//
//  PeopleModifier.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import Foundation

protocol PeopleModifier {
    func changeStatusOfPerson(with index: Int)
    func changeNameOfPerson(with index: Int, to newName: String)
    func add(person: Person)
    func remove(personAt index: Int)
    func peopleCount() -> Int
}

class RealPeopleModifier: PeopleModifier {
    private let peopleViewData: PeopleView.Data
    
    init(data: PeopleView.Data) {
        self.peopleViewData = data
    }
    
    func changeStatusOfPerson(with index: Int) {
        guard !peopleViewData.people.isEmpty else {
            return
        }
        
        DispatchQueue.main.async {
            self.peopleViewData.people[index].status.toggle()
        }
    }
    
    func changeNameOfPerson(with index: Int, to newName: String) {
        guard !peopleViewData.people.isEmpty else {
            return
        }
        
        DispatchQueue.main.async {
            self.peopleViewData.people[index].name = newName
        }
    }
    
    func add(person: Person) {
        DispatchQueue.main.async {
            self.peopleViewData.people.append(person)
        }
    }
    
    func remove(personAt index: Int) {
        guard !peopleViewData.people.isEmpty else {
            return
        }
        
        DispatchQueue.main.async {
            self.peopleViewData.people.remove(at: index)
        }
    }
    
    func peopleCount() -> Int {
        return peopleViewData.people.count
    }
}
