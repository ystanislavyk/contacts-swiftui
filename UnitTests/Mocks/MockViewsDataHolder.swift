//
//  MockViewsDataHolder.swift
//  UnitTests
//
//  Created by Yaroslav Stanislavyk on 09.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

@testable import Contacts

class MockViewsDataHolder: Mock<MockViewsDataHolder.Actions>, ViewsDataHolder {
    enum Actions {
        case peopleView
        case detailedInfoView
    }
    
    func peopleView() -> PeopleView.Data {
        registerCall(.peopleView)
        return PeopleView.Data()
    }
    
    func detailedInfoView() -> DetailedInfoView.Data {
        registerCall(.detailedInfoView)
        return DetailedInfoView.Data()
    }
}
