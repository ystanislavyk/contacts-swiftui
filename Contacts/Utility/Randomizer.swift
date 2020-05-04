//
//  Randomizer.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

func randomIndex(limitedBy count: Int) -> Int {
    if count <= 0 {
        return 0
    }
    return Int.random(in: 0...count - 1)
}
