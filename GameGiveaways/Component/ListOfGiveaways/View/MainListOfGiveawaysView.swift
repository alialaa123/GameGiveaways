//
//  MainListOfGiveawaysView.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI
import Domain
import Data
import NetworkLayer

struct MainListOfGiveawaysView: View {
    // MARK: - Properties
    @StateObject var viewModel: ListOfGiveawaysViewModel
    /// Need offset from the scrollView in the ParentView and not taking the Global view Offset
    let coordinateSpace: String = "giveawayCoordinateSpace"
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            MainAppHeader(
                userName: "Bou",
                headerTitle: "Explore \nGames Giveaways"
            )
            
            GiveawayFilterView(selectedPlatform: $viewModel.platformCategorySelected)
            
            Spacer(minLength: 1)
            
            /// For showing Error message
            if viewModel.shouldShowError {
                ErrorMessageView(errorMessage: viewModel.errorMessage)
            }
            
            if let giveaways = viewModel.giveaways {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        ForEach(Array(giveaways.enumerated()), id: \.offset) { (_, giveaway) in
                            GiveawayCardView(
                                giveaway: giveaway,
                                giveawaySelected: $viewModel.giveawaySelected,
                                coordinateSpace: coordinateSpace
                            )
                        }
                    }
                    .padding(.vertical, 20)
                }
                .coordinateSpace(name: coordinateSpace)
            }
        }
        
        .ignoresSafeArea()
        .padding()
    }
}
