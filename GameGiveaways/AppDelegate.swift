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
    var mainCoordinator: MainAppCoordinator?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let appMainDependency = DefaultMainAppDependencyContainer()
        
        mainCoordinator = MainAppCoordinator(window: window, dependencyContainer: appMainDependency)
        
        mainCoordinator?.start()
        
        window.makeKeyAndVisible()
        
        self.window = window
        return true
    }
}
