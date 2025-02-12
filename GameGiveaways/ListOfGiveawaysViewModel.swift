//
//  ListOfGiveawaysViewmodel.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import Foundation
import Domain
import Combine

final class ListOfGiveawaysViewModel: ObservableObject {
    // MARK: - Properties
    @Published var giveaways: [Giveaway] = []
    
    // UseCases
    private let listOfGiveawaysUseCase: ListOfGiveawaysUseCase
    
    // Cancellable
    private let cancellable = Set<AnyCancellable>()
    
    // MARK: - Life cycle
    init(listOfGiveawaysUseCase: ListOfGiveawaysUseCase) {
        self.listOfGiveawaysUseCase = listOfGiveawaysUseCase
        getListOfGiveaways()
    }
    
    // MARK: - Methods
    func getListOfGiveaways() {
        Task {
            do {
                let giveaways = try await self.listOfGiveawaysUseCase.execute(with: "")
                print("DEBUG: data back with: \(giveaways)")
                await MainActor.run {
                    self.giveaways = giveaways
                }
            } catch {
                print("DEBUG: error happen well getting: \(error.localizedDescription)")
            }
        }
    }
    
}
