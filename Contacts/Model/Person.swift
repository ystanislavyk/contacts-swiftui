//
//  Person.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 05.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import Foundation
import SwiftUI

typealias People = [Person]

class Person: Identifiable, ObservableObject {
    let id = UUID()
    @Published var name: String
    @Published var status: Status
    @Published var email: String
    @Published var image: UIImage
    
    init(name: String, status: Status, email: String, image: UIImage) {
        self.name = name
        self.status = status
        self.email = email
        self.image = image
    }
    
    convenience init() {
        self.init(name: "", status: .online, email: "", image: UIImage())
    }
}

extension Person {
    enum Status {
        case offline
        case online
        
        mutating func toggle() {
            switch self {
                case .offline:
                    self = .online
                case .online:
                    self = .offline
            }
        }
        
        func stringRepresentation() -> String {
            switch self {
                case .offline:
                    return "offline"
                case .online:
                    return "online"
            }
        }
        
        func colorRepresentation() -> Color {
            switch self {
                case .offline:
                    return .gray
                case .online:
                    return .green
            }
        }
    }
}

extension Person: Equatable {
    public static func ==(lhs: Person, rhs: Person) -> Bool {
        return (lhs.name == rhs.name) &&
               (lhs.status == rhs.status) &&
               (lhs.email == rhs.email) &&
               (lhs.image == rhs.image)
    }
}
