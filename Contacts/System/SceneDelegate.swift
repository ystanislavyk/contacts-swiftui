//
//  SceneDelegate.swift
//  Contacts
//
//  Created by Yaroslav Stanislavyk on 04.05.2020.
//  Copyright © 2020 Yaroslav Stanislavyk. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let applicationEnvironment = ApplicationEnvironment.initialize()
        let contentView = ContentView(viewRouter: applicationEnvironment.dependenciesContainer.viewRouter).inject(applicationEnvironment.dependenciesContainer)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
