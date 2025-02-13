//
//  MainAppDependencyContainer.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI
import Domain

protocol MainAppDependencyContainer: Sendable {
    func makeMainListOfGiveawaysView(with action: ListOfGiveawaysAction) -> UIHostingController<MainListOfGiveawaysView>
    
    func makeGiveawayDetailsView(
        with giveaway: Giveaway,
        action: GiveawayDetailsAction
    ) -> UIHostingController<GiveawayDetailsView>
}
