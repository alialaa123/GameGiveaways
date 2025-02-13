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
    @Published var giveaways: [Giveaway]?
    @Published var giveawaySelected: Giveaway?
    
    /// Platform Filter
    @Published var platformCategorySelected = PlatformCategories.all
    
    /// Error
    @Published var shouldShowError: Bool = false
    @Published var errorMessage: String?
    
    /// UseCases
    private let listOfGiveawaysUseCase: ListOfGiveawaysUseCase
    
    /// Action
    private weak var listOfGiveawaysAction: ListOfGiveawaysAction?
    
    /// Task
    var listOfGiveawaysTask: Task<Void, Never>?
    
    /// Cancellable
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Life cycle
    init(
        listOfGiveawaysUseCase: ListOfGiveawaysUseCase,
        listOfGiveawaysAction: ListOfGiveawaysAction
    ) {
        self.listOfGiveawaysUseCase = listOfGiveawaysUseCase
        self.listOfGiveawaysAction = listOfGiveawaysAction
        getListOfGiveaways()
        /// Observation Action
        observeCategorySelection()
        observeGiveawaySelection()
    }
    
    deinit {
        listOfGiveawaysTask?.cancel()
    }
    
    // MARK: - Methods
    func getListOfGiveaways() {
        listOfGiveawaysTask = Task { [weak self] in
            guard let self else { return }
            do {
                let giveaways = try await self.listOfGiveawaysUseCase.execute(
                    with: platformCategorySelected.RequestPlatformForURL
                )
                await MainActor.run {
                    self.giveaways = nil
                    self.giveaways = giveaways
                }
            } catch {
                await MainActor.run {
                    self.shouldShowError = true
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    private func refreshData() {
        self.shouldShowError = false
        self.errorMessage = nil
        self.giveaways = nil
        self.getListOfGiveaways()
    }
    
    private func navigateToDetail(for giveaway: Giveaway) {
        listOfGiveawaysAction?.navigateToGiveawayDetailsView(with: giveaway)
    }
}

// MARK: - Observation Methods for action
extension ListOfGiveawaysViewModel {
    private func observeCategorySelection() {
        $platformCategorySelected
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] selectedCategory in
                guard let self else { return }
                self.refreshData()
            }
            .store(in: &cancellable)
    }
    
    private func observeGiveawaySelection() {
        $giveawaySelected
            .receive(on: DispatchQueue.main)
            .sink { [weak self] giveaway in
                guard let self, let giveaway else { return }
                self.navigateToDetail(for: giveaway)
            }
            .store(in: &cancellable)
    }
}
