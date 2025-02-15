//
//  MainAppCoordinator.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import UIKit
import Domain

final class MainAppCoordinator {
    // MARK: - Properties
    let navigationController = UINavigationController()
    
    /// Long lived properties
    private let window: UIWindow
    private let dependencyContainer: MainAppDependencyContainer
    
    // MARK: - Life cycle
    public init(window: UIWindow, dependencyContainer: MainAppDependencyContainer) {
        self.window = window
        self.dependencyContainer = dependencyContainer
    }
    
    // MARK: - Method
    func start() {
        let view = dependencyContainer.makeMainListOfGiveawaysView(with: self)
        
        navigationController.pushViewController(view, animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        window.rootViewController = navigationController
    }
}

// MARK: - List of Giveaway Actions
extension MainAppCoordinator: ListOfGiveawaysAction {
    func navigateToGiveawayDetailsView(with giveaway: Giveaway) {
        let view = dependencyContainer.makeGiveawayDetailsView(
            with: giveaway,
            action: self
        )
        
        navigationController.pushViewController(view, animated: true)
    }
    
    func navigateToMoreView(with categories: [Giveaway]) {
        let view = dependencyContainer.makeMoreView(with: categories)
        navigationController.setNavigationBarHidden(false, animated: true)
        
        navigationController.pushViewController(view, animated: true)
    }
}

// MARK: - Giveaways details Actions
extension MainAppCoordinator: GiveawayDetailsAction {
    func dismiss() {
        navigationController.popViewController(animated: true)
    }
}
