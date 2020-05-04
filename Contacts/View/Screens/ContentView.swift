//
//  ContentView.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 05.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.injected) private var injected: DependenciesContainer
    
    @ObservedObject private var viewRouter: ViewRouter
    
    init(viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
    }
    
    var body: some View {
        VStack {
            self.content()
        }
    }
}

extension ContentView {
    func content() -> some View {
        Group {
            if viewRouter.currentView == .peopleView {
                PeopleView(data: injected.viewsDataHolder.peopleView(), interactor: injected.interactors.peopleInteractor)
                    .transition(.scale)
            } else {
                DetailedInfoView(data: injected.viewsDataHolder.detailedInfoView())
                    .transition(.scale)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter(viewsDataHolder: RealViewsDataHolder()))
    }
}
