//
//  PeopleInteractor.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 06.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI
import Combine

protocol PeopleInteractor {
    func load(peopleList: Binding<People>)
    func randomize()
    func randomize(times: Int, withInterval interval: TimeInterval)
}

class RealPeopleInteractor: PeopleInteractor {
    private let peopleRepository: PeopleRepository
    private let peopleRandomizer: PeopleRandomizer
    
    private let queuesHolder: QueuesHolder
    
    init(peopleRepository: PeopleRepository, peopleRandomizer: PeopleRandomizer, queuesHolder: QueuesHolder) {
        self.peopleRepository = peopleRepository
        self.peopleRandomizer = peopleRandomizer
        self.queuesHolder = queuesHolder
    }
    
    func load(peopleList: Binding<People>) {
        queuesHolder.backgroundQueue().async {
            _ = self.peopleRepository.loadPeople().receive(on: RunLoop.main)
                                                  .sink(receiveCompletion: { completion in
                // TODO: Add completion handling
                switch completion {
                    case .finished:
                        print("Finished")
                    case .failure(_):
                        print("Error")
                }
            }, receiveValue: { receivedPeopleList in
                peopleList.wrappedValue = receivedPeopleList
            })
        }
    }
    
    func randomize() {
        queuesHolder.backgroundQueue().async {
            self.peopleRandomizer.randomize()
        }
    }
    
    func randomize(times: Int, withInterval interval: TimeInterval) {
        queuesHolder.backgroundQueue().async {
            self.peopleRandomizer.randomize(times: times, withInterval: interval)
        }
    }
}

struct StubPeopleInteractor: PeopleInteractor {
    func load(peopleList: Binding<People>) {}
    func randomize() {}
    func randomize(times: Int, withInterval interval: TimeInterval) {}
}
