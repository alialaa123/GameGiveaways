//
//  ListOfGiveawaysAction.swift
//  GameGiveaways
//
//  Created by ali alaa on 13/02/2025.
//

import Foundation
import Domain

protocol ListOfGiveawaysAction: AnyObject {
    func navigateToGiveawayDetailsView(with giveaway: Giveaway)
}
