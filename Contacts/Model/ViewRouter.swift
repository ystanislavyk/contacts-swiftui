//
//  ViewRouter.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 05.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    enum View {
        case peopleView
        case detailedInfoView
    }
    
    init(viewsDataHolder: ViewsDataHolder) {
        self.viewsDataHolder = viewsDataHolder
    }
    
    let objectWillChange = PassthroughSubject<ViewRouter, Never>()
    
    private(set) var currentView: ViewRouter.View = .peopleView {
        didSet {
            withAnimation {
                print("Object changed")
                objectWillChange.send(self)
            }
        }
    }
    
    private let viewsDataHolder: ViewsDataHolder
}

extension ViewRouter {
    func routeTo(view: View) {
        currentView = view
    }
    
    func routeTo(view: View, with data: Any) {
        if view == .detailedInfoView {
            viewsDataHolder.detailedInfoView().person = data as! Person
        }
        currentView = view
    }
}
