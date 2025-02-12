//
//  ListOfGiveawaysUseCase.swift
//  Domain
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation


public protocol ListOfGiveawaysUseCase {
    func execute(with platform: String?) async throws -> [Giveaway]
}


public final class DefaultListOfGiveawaysUseCase: ListOfGiveawaysUseCase {
    // MARK: - Properties
    private let repository: ListOfGiveawayRepository
    
    // MARK: - Life cycle
    public init(repository: ListOfGiveawayRepository) {
        self.repository = repository
    }
    
    // MARK: - Method
    public func execute(with platform: String?) async throws -> [Giveaway] {
        try await repository.getListOfGiveaways(with: platform)
    }
}
