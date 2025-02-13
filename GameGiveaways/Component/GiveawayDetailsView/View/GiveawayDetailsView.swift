//
//  GiveawayDetailsView.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI

struct GiveawayDetailsView: View {
    // MARK: - Properties
    @StateObject var viewModel: GiveawayDetailsViewModel
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                /// Hero Image with its context
                heroImageContext
                
                /// Header view
                InternalHeader(
                    isDismiss: $viewModel.isDismiss,
                    isFavorite: $viewModel.giveaway.isFavorite
                )
            }
            .frame(maxWidth: .infinity)
            
            /// Stack of information
            StackInformationView(
                informations: [
                    StackInformation(
                        iconImage: "coloncurrencysign.square.fill",
                        text: viewModel.giveaway.detailInformation.worth
                    ),
                    StackInformation(
                        iconImage: "person.3.sequence.fill",
                        text: "\(viewModel.giveaway.detailInformation.users)"
                    ),
                    StackInformation(
                        iconImage: "gamecontroller.fill",
                        text: viewModel.giveaway.detailInformation.type
                    )
                ]
            )
            
            /// Scroll view for information
            ScrollDetailInformationView(information: viewModel.giveaway.detailInformation)
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Sub views
    /// Hero Image Context
    var heroImageContext: some View {
        ZStack(alignment: .bottomLeading) {
            GiveawayImage(
                giveawayImageURL: viewModel.giveaway.imageURL,
                height: 400,
                width: UIScreen.main.bounds.width
            )
            
            bottomContextUpperHeroImage
            
        }
    }
    
    /// Bottom Context upper Hero image
    var bottomContextUpperHeroImage: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(viewModel.giveaway.title)
                .foregroundStyle(.white)
                .font(.system(size: 21, weight: .bold, design: .rounded))
            
            Spacer()
            
            Button {
                // TODO: - Get it action button need to be done later
            } label: {
                Text("Get it")
                    .foregroundStyle(.black)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
        }
        .padding()
    }
}
