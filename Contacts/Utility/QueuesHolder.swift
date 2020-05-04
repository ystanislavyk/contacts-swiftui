//
//  QueuesHolder.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import Foundation

protocol QueuesHolder {
    func backgroundQueue() -> DispatchQueue
    func randomizationQueue() -> DispatchQueue
}

class RealQueuesHolder: QueuesHolder {
    private let bg_queue = DispatchQueue(label: "\(Bundle.main.bundleIdentifier!).background")
    private let r_queue = DispatchQueue(label: "\(Bundle.main.bundleIdentifier!).randomization")
    
    func backgroundQueue() -> DispatchQueue {
        return bg_queue
    }
    
    func randomizationQueue() -> DispatchQueue {
        return r_queue
    }
}
