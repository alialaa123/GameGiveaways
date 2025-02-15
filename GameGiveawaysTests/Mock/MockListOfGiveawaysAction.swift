//
//  MockListOfGiveawaysAction.swift
//  GameGiveawaysTests
//
//  Created by ali alaa on 15/02/2025.
//

import Foundation
import Domain
@testable import GameGiveaways

class MockListOfGiveawaysAction: ListOfGiveawaysAction {
    // MARK: - Properties
    var navigateToGiveawayDetailsViewCalled = false
    var navigateToMoreViewCalled = false
    var navigatedGiveaway: Giveaway?
    
    // MARK: - Method
    func navigateToGiveawayDetailsView(with giveaway: Giveaway) {
        navigateToGiveawayDetailsViewCalled = true
        navigatedGiveaway = giveaway
    }
    
    func navigateToMoreView(with categories: [Giveaway]) {
        navigateToMoreViewCalled = true
    }
}
