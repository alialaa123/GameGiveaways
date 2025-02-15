//
//  CustomGiveawayCard.swift
//  GameGiveaways
//
//  Created by ali alaa on 14/02/2025.
//

import SwiftUI
import Domain

struct CustomGiveawayCard: View {
    // MARK: - Properties
    @Binding var giveaway: Giveaway
    @State var isFavoriteAvailable: Bool = true
    
    /// View aspects
    var width: CGFloat
    var height: CGFloat
    
    // MARK: - View
    var body: some View {
        ZStack(alignment: .topLeading) {
            GiveawayImage(
                giveawayImageURL: giveaway.imageURL,
                height: height,
                width: width
            )
            
            /// Card information above Image
            VStack {
                cardInformationTopContent
                
                Spacer()
                
                cardInformationBottomContent
            }
            .padding()
        }
        .frame(height: height)
    }
    
    // MARK: - View Top Content
    var cardInformationTopContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Text(giveaway.title)
                    .font(.system(size: 21, weight: .bold, design: .rounded))
                    .foregroundStyle( .white)
                
                Spacer()
                
                if isFavoriteAvailable {
                    Button {
                        giveaway.isFavorite.toggle()
                    } label: {
                        Image(systemName: giveaway.isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                    }
                    .frame(width: 30, height: 30)
                }
            }
            
            Text(giveaway.detailInformation.platforms)
                .font(.system(size: 12, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.8))
        }
    }
    
    // MARK: - View Bottom Content
    var cardInformationBottomContent: some View {
        Text(giveaway.detailInformation.description)
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .lineSpacing(2)
            .foregroundStyle(.white.opacity(0.8))
            .padding(.bottom, 4)
    }
}
