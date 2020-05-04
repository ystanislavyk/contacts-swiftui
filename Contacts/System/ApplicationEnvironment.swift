//
//  ApplicationEnvironment.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 06.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

class ApplicationEnvironment {
    let dependenciesContainer: DependenciesContainer
    
    init(dependenciesContainer: DependenciesContainer) {
        self.dependenciesContainer = dependenciesContainer
    }
}

extension ApplicationEnvironment {
    class func initialize() -> ApplicationEnvironment {
        let queuesHolder = RealQueuesHolder()
        let imagesWebRepository = RealImagesWebRepository()
        let peopleRepository = RealPeopleRepository(imagesRepository: imagesWebRepository)
        
        let viewsDataHolder = RealViewsDataHolder()
        let viewRouter = ViewRouter(viewsDataHolder: viewsDataHolder)
        
        let peopleModifier = RealPeopleModifier(data: viewsDataHolder.peopleView())
        let peopleModificationRandomizer = RealPeopleModificationRandomizer(peopleModifier: peopleModifier, peopleRepository: peopleRepository, imagesRepository: imagesWebRepository)
        let peopleRandomizer = RealPeopleRandomizer(peopleModificationRandomizer: peopleModificationRandomizer, queuesHolder: queuesHolder)
        
        let peopleInteractor = RealPeopleInteractor(peopleRepository: peopleRepository, peopleRandomizer: peopleRandomizer, queuesHolder: queuesHolder)
        let interactors = DependenciesContainer.Interactors(peopleInteractor: peopleInteractor)
        
        let dependenciesContainer = DependenciesContainer(viewsDataHolder: viewsDataHolder, viewRouter: viewRouter, interactors: interactors)
        
        return ApplicationEnvironment(dependenciesContainer: dependenciesContainer)
    }
}
