//
//  PeopleViewModePicker.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 06.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

struct SegmentedPickerView: View {
    @Environment(\.injected) private var injected: DependenciesContainer
    
    @Binding private var viewMode: UInt8
    
    init(viewMode: Binding<UInt8>) {
        self._viewMode = viewMode
    }
    
    var body: some View {
        HStack {
            Picker(selection: $viewMode, label: Text("View Picker")) {
                Text(PeopleView.ViewMode.list.text).tag(PeopleView.ViewMode.list.tag)
                Text(PeopleView.ViewMode.grid.text).tag(PeopleView.ViewMode.grid.tag)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 85)
        }
    }
}

struct SegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PersonIconView(person: Person(name: "Person", status: .online, email: "person@email.com", image: UIImage()))
    }
}
