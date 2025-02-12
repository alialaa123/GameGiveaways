//
//  ListOfGiveawayRepository.swift
//  Domain
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation

public protocol ListOfGiveawayRepository {
    func getListOfGiveaways(with platform: String?) async throws -> [Giveaway]
}
