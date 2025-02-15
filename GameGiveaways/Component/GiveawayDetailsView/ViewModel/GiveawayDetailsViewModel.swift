//
//  GiveawayDetailsViewModel.swift
//  GameGiveaways
//
//  Created by ali alaa on 13/02/2025.
//

import Foundation
import Domain
import Combine

final class GiveawayDetailsViewModel: ObservableObject {
    // MARK: - Properties
    @Published var giveaway: Giveaway
    @Published var isDismiss: Bool = false
    
    /// Action for view
    private weak var action: GiveawayDetailsAction?
    
    /// Cancellable
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Life cycle
    init(
        giveaway: Giveaway,
        action: GiveawayDetailsAction? = nil
    ) {
        self.giveaway = giveaway
        self.action = action
        /// Observe actions
        observeIsDismiss()
    }
    
    // MARK: - Method
    private func dismiss() {
        action?.dismiss()
    }
}

// MARK: - Observation Actions
extension GiveawayDetailsViewModel {
    private func observeIsDismiss() {
        $isDismiss
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isDismiss in
                guard let self, isDismiss else { return }
                self.dismiss()
            }
            .store(in: &cancellable)
    }
}
