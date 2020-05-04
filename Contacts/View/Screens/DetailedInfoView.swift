//
//  DetailedInfoView.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 05.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

struct DetailedInfoView: View {
    @Environment(\.injected) private var injected: DependenciesContainer
    
    @ObservedObject private var viewData: DetailedInfoView.Data
        
    init(data: DetailedInfoView.Data) {
        self.viewData = data
    }
        
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.injected.viewRouter.routeTo(view: .peopleView)
                }) {
                    Text("Back")
                        .font(.headline)
                        .fontWeight(.medium)
                }
                .padding()
                Spacer()
            }
            Image(uiImage: viewData.person.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.top, 70)
            Text(viewData.person.name)
                .font(.largeTitle)
                .fontWeight(.regular).padding(.bottom, 10)
            Text(viewData.person.status.stringRepresentation())
                .font(.title).padding(.bottom, 10)
            Text(viewData.person.email)
                .font(.title)
                .foregroundColor(.blue)
            Spacer()
        }
    }
}

extension DetailedInfoView {
    class Data: ObservableObject {
        @Published var person = Person()
    }
}

struct DetailedInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedInfoView(data: DetailedInfoView.Data())
    }
}
