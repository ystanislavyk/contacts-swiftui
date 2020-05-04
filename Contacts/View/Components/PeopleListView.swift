//
//  PeopleListView.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 06.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

struct PeopleListView: View {
    @Environment(\.injected) private var injected: DependenciesContainer
    
    @ObservedObject private var viewData: PeopleView.Data
    
    init(viewData: PeopleView.Data) {
        self.viewData = viewData
    }
    
    var body: some View {
        List(viewData.people) { person in
            Button(action: {
                self.injected.viewRouter.routeTo(view: .detailedInfoView, with: person)
            }) {
                ListRowView(person: person)
            }
            .frame(height: 50)
        }
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView(viewData: PeopleView.Data())
    }
}
