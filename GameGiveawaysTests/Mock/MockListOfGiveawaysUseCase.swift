//
//  MockListOfGiveawaysUseCase.swift
//  GameGiveawaysTests
//
//  Created by ali alaa on 15/02/2025.
//

import Foundation
import Domain

class MockListOfGiveawaysUseCase: ListOfGiveawaysUseCase {
    // MARK: - Properties
    var executeCalled = false
    var givenResult: Result<[Giveaway], Error>
    
    // MARK: - Life cycle
    init(giveResult: Result<[Giveaway], Error>) {
        self.givenResult = giveResult
    }
    
    // MARK: - Method
    func execute(with platform: String?) async throws -> [Giveaway] {
        executeCalled = true
        switch givenResult {
        case .success(let giveaways):
            return giveaways
        case .failure(let error):
            throw error
        }
    }
}
