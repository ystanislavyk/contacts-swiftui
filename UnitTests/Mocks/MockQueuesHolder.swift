//
//  MockQueuesHolder.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

@testable import Contacts

import Foundation

class MockQueuesHolder: Mock<MockQueuesHolder.Actions>, QueuesHolder {
    enum Actions {
        case backgroundQueue
        case randomizationQueue
    }
    
    func backgroundQueue() -> DispatchQueue {
        registerCall(.backgroundQueue)
        return DispatchQueue(label: "")
    }
    
    func randomizationQueue() -> DispatchQueue {
        registerCall(.randomizationQueue)
        return DispatchQueue(label: "")
    }
}
