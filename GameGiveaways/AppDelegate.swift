//
//  AppDelegate.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import UIKit
import SwiftUI
import Domain
import Data
import NetworkLayer

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController()
        let viewModel = ListOfGiveawaysViewModel(
            listOfGiveawaysUseCase: DefaultListOfGiveawaysUseCase(
                repository: DefaultGetListOfGiveawayRemote(
                    networkClient: NetworkManager(baseURL: URL(string: "https://www.gamerpower.com/api")!)
                )
            )
        )
        let view = UIHostingController(rootView: ContentView(viewModel: viewModel))
        navigationController.pushViewController(view, animated: false)
        
        window.rootViewController = navigationController
        
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }
}
