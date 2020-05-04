//
//  Mock.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import XCTest

class Mock<Action> where Action: Equatable {
    private var registeredCalls = [Action]()
    private var expectedCalls = [Action]()
    
    final func registerCall(_ action: Action) {
        compareExpectedCalls(with: action)
    }
    
    final func expectCall(_ action: Action, times: UInt = 1) {
        guard (times > 0) else {
            return
        }
        
        for _ in 0..<times {
            expectedCalls.append(action)
        }
    }
    
    final func verifyAllCalls() {
        if !expectedCalls.isEmpty {
            var remainingCalls: String = ""
            for call in expectedCalls {
                remainingCalls.append(contentsOf: " \(call)")
            }
            XCTFail("Not all expected calls were called. Remaining calls: \(remainingCalls);")
        }
    }
    
    private func compareExpectedCalls(with action: Action) {
        if let index = expectedCalls.firstIndex(of: action) {
            expectedCalls.remove(at: index)
        } else {
            XCTFail("Unexpected Call: \(action)")
        }
    }
}
