//
//  PersonIconView.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 05.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

struct PersonIconView: View {    
    @ObservedObject private var person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    var body: some View {
        ZStack {
            Image(uiImage: person.image).renderingMode(.original).resizable().scaledToFit().frame(width: 35, height: 35)
            ZStack {
                Circle().foregroundColor(person.status.colorRepresentation())
                    .frame(width: 13, height: 13)
                Circle().foregroundColor(person.status.colorRepresentation())
                    .frame(width: 11, height: 11)
            }
            .padding(.top, 25)
            .padding(.leading, 25)
        }
    }
}

struct PersonIconView_Previews: PreviewProvider {
    static var previews: some View {
        PersonIconView(person: Person(name: "Person", status: .online, email: "person@email.com", image: UIImage()))
    }
}
