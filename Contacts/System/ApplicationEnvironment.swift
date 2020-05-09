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
        let webImagesFetcher = RealWebImageFetcher()
        let imagesWebRepository = RealImagesWebRepository(webImagesFetcher: webImagesFetcher)
        let indexRandomizer = RealIndexRandomizer()
        let peopleRepository = RealPeopleRepository(imagesRepository: imagesWebRepository, indexRandomizer: indexRandomizer)
        
        let viewsDataHolder = RealViewsDataHolder()
        let viewRouter = ViewRouter(viewsDataHolder: viewsDataHolder)
        
        let peopleModifier = RealPeopleModifier(data: viewsDataHolder.peopleView())
        let randomizer = RealRandomizer(peopleRepository: peopleRepository, imagesRepository: imagesWebRepository, indexRandomizer: indexRandomizer)
        let peopleModificationRandomizer = RealPeopleModificationRandomizer(peopleModifier: peopleModifier, indexRandomizer: indexRandomizer, randomizer: randomizer)
        let peopleRandomizer = RealPeopleRandomizer(indexRandomizer: indexRandomizer, peopleModificationRandomizer: peopleModificationRandomizer, queuesHolder: queuesHolder)
        
        let peopleInteractor = RealPeopleInteractor(peopleRepository: peopleRepository, peopleRandomizer: peopleRandomizer, queuesHolder: queuesHolder)
        let interactors = DependenciesContainer.Interactors(peopleInteractor: peopleInteractor)
        
        let dependenciesContainer = DependenciesContainer(viewsDataHolder: viewsDataHolder, viewRouter: viewRouter, interactors: interactors)
        
        return ApplicationEnvironment(dependenciesContainer: dependenciesContainer)
    }
}
