//
//  DefaultMainAppDependencyContainer.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI
import Domain
import Data
import NetworkLayer

final class DefaultMainAppDependencyContainer: MainAppDependencyContainer {
    // MARK: - Methods
    public func makeMainListOfGiveawaysView(with action: ListOfGiveawaysAction) -> UIHostingController<MainListOfGiveawaysView> {
        UIHostingController(
            rootView: MainListOfGiveawaysView(viewModel: self.makeListOfGiveawaysViewModel(with: action))
        )
    }
    
    private func makeListOfGiveawaysViewModel(with action: ListOfGiveawaysAction) -> ListOfGiveawaysViewModel {
        ListOfGiveawaysViewModel(
            listOfGiveawaysUseCase: makeListOfGiveawaysUseCase(),
            listOfGiveawaysAction: action
        )
    }
    
    private func makeListOfGiveawaysUseCase() -> ListOfGiveawaysUseCase {
        DefaultListOfGiveawaysUseCase(repository: makeListOfGiveawaysRepository())
    }
    
    private func makeListOfGiveawaysRepository() -> ListOfGiveawayRepository {
        DefaultGetListOfGiveawayRemote(
            networkClient: NetworkManager(
                baseURL: AppEnvironmentConfiguration.development.baseURL
            )
        )
    }
}

// MARK: - Giveaway Details View
extension DefaultMainAppDependencyContainer {
    func makeGiveawayDetailsView(
        with giveaway: Giveaway,
        action: GiveawayDetailsAction
    ) -> UIHostingController<GiveawayDetailsView> {
        UIHostingController(
            rootView: GiveawayDetailsView(
                viewModel: self.makeGiveawayDetailsViewModel(
                    with: giveaway,
                    action: action
                )
            )
        )
    }
    
    private func makeGiveawayDetailsViewModel(
        with giveaway: Giveaway,
        action: GiveawayDetailsAction
    ) -> GiveawayDetailsViewModel {
        GiveawayDetailsViewModel(giveaway: giveaway, action: action)
    }
}
