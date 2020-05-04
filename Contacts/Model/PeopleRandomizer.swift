//
//  PeopleRandomizer.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import Foundation

typealias Actions = [Int : () -> ()]

protocol PeopleRandomizer {
    func randomize()
    func randomize(times: Int, withInterval interval: TimeInterval)
}

class RealPeopleRandomizer: PeopleRandomizer {
    private let peopleModificationRandomizer: PeopleModificationRandomizer
    private let queuesHolder: QueuesHolder
    
    init(peopleModificationRandomizer: PeopleModificationRandomizer, queuesHolder: QueuesHolder) {
        self.peopleModificationRandomizer = peopleModificationRandomizer
        self.queuesHolder = queuesHolder
    }
    
    func randomize() {
        let actions = [0: peopleModificationRandomizer.randomStatusModification,
                       1: peopleModificationRandomizer.randomNameModification,
                       2: peopleModificationRandomizer.randomAdding,
                       3: peopleModificationRandomizer.randomDeletion
                      ]
        randomize(actions: actions)
    }
    
    func randomize(times: Int, withInterval interval: TimeInterval) {
        let dispatchGroup = DispatchGroup()
        for _ in 0..<times {
            dispatchGroup.enter()
            self.queuesHolder.randomizationQueue().async {
                // TODO: - Add cancellation solution
                self.randomize()
                Thread.sleep(forTimeInterval: interval)
                dispatchGroup.leave()
            }
            dispatchGroup.wait()
        }
    }
    
    func randomize(actions: Actions) {
        actions[randomIndex(limitedBy: actions.count)]!()
    }
}
