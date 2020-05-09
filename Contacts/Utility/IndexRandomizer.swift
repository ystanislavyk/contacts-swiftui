//
//  IndexRandomizer.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

protocol IndexRandomizer {
    func randomIndex(limitedBy elementsCount: Int) throws -> Int
}

class RealIndexRandomizer: IndexRandomizer {
    func randomIndex(limitedBy elementsCount: Int) throws -> Int {
        if elementsCount <= 0 {
            throw RandomizerError.outOfBounds("The random index can't be generated for the empty container")
        }
        return Int.random(in: 0...elementsCount - 1)
    }
}
