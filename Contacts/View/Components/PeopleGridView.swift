//
//  PeopleGridView.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 06.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI
import QGrid

struct PeopleGridView: View {
    @Environment(\.injected) private var injected: DependenciesContainer
    
    @ObservedObject private var viewData: PeopleView.Data
    
    init(viewData: PeopleView.Data) {
        self.viewData = viewData
    }
    
    var body: some View {
        QGrid(viewData.people, columns: 6) { person in
            VStack() {
                Button(action: {
                    self.injected.viewRouter.routeTo(view: .detailedInfoView, with: person)
                }) {
                    PersonIconView(person: person)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct PeopleGridView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleGridView(viewData: PeopleView.Data())
    }
}
