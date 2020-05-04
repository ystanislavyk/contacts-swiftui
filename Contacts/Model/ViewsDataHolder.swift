//
//  ViewsDataHolder.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 07.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import SwiftUI

protocol ViewsDataHolder {
    func peopleView() -> PeopleView.Data
    func detailedInfoView() -> DetailedInfoView.Data
}

class RealViewsDataHolder: ViewsDataHolder {
    private let peopleViewData = PeopleView.Data()
    private let detailedInfoViewData = DetailedInfoView.Data()
    
    func peopleView() -> PeopleView.Data {
        return peopleViewData
    }
    
    func detailedInfoView() -> DetailedInfoView.Data {
        return detailedInfoViewData
    }
}
