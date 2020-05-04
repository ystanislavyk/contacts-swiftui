//
//  ListRowView.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 08.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

struct ListRowView: View {
    @ObservedObject private var person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    var body: some View {
        HStack {
            PersonIconView(person: person)
                .padding(.trailing, 1)
            Text(person.name)
                .fontWeight(.light)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(person: Person(name: "Person", status: .online, email: "person@email.com", image: UIImage()))
    }
}
