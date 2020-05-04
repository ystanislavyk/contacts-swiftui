//
//  DependenciesContainer.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 06.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI
import Combine

struct DependenciesContainer: EnvironmentKey {
    let viewsDataHolder: ViewsDataHolder
    let viewRouter: ViewRouter
    let interactors: Interactors
    
    init(viewsDataHolder: ViewsDataHolder, viewRouter: ViewRouter, interactors: Interactors) {
        self.viewsDataHolder = viewsDataHolder
        self.viewRouter = viewRouter
        self.interactors = interactors
    }
    
    static var defaultValue: Self { Self.default }
    
    private static let `default` = Self(viewsDataHolder: RealViewsDataHolder(), viewRouter: ViewRouter(viewsDataHolder: RealViewsDataHolder()), interactors: .stub)
}

extension EnvironmentValues {
    var injected: DependenciesContainer {
        get { self[DependenciesContainer.self] }
        set { self[DependenciesContainer.self] = newValue }
    }
}

extension View {
    func inject(_ container: DependenciesContainer) -> some View {
        return self
            .environment(\.injected, container)
    }
}

extension DependenciesContainer {
    struct Interactors {
        let peopleInteractor: PeopleInteractor
        
        init(peopleInteractor: PeopleInteractor) {
            self.peopleInteractor = peopleInteractor
        }
        
        static var stub: Self {
            .init(peopleInteractor: StubPeopleInteractor())
        }
    }
}
