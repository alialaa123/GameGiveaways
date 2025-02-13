//
//  GiveawayCardView.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI
import Domain

struct GiveawayCardView: View {
    // MARK: - properties
    @State var giveaway: Giveaway
    @Binding var giveawaySelected: Giveaway?
    
    /// Need offset from the scrollView in the ParentView and not taking the Global view Offset
    let coordinateSpace: String
    
    /// View aspects
    var height: CGFloat = 300
    
    // MARK: - View
    var body: some View {
        GeometryReader {
            let size = $0.size
            let rect = $0.frame(in: .named(coordinateSpace))
            
            ZStack(alignment: .topLeading) {
                GiveawayImage(
                    giveawayImageURL: giveaway.imageURL,
                    height: height,
                    width: size.width
                )
                
                VStack {
                    cardInformationTopContent
                    
                    Spacer()
                    
                    cardInformationBottomContent
                    
                }
                .padding()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .rotation3DEffect(
                .init(degrees: convertOffsetToRotation(rect)),
                axis: (x: 1, y: 0, z: 0),
                anchor: .bottom,
                anchorZ: 1,
                perspective: 0.85
            )
        }
        .frame(height: height)
        .onTapGesture {
            giveawaySelected = giveaway
        }
    }
    
    // MARK: - View Top Content
    var cardInformationTopContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Text(giveaway.title)
                    .font(.system(size: 21, weight: .bold, design: .rounded))
                    .foregroundStyle( .white)
                
                Spacer()
                
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
    }
    
    // MARK: - Method
    /// covert `Offset` to `Rotation`
    func convertOffsetToRotation(_ rect: CGRect) -> CGFloat {
        let cardHeight = rect.height + 20
        let minY = rect.minY - 20
        let progress: CGFloat = minY < 0 ? (minY / cardHeight) : 0
        let constrainedProgress = min(-progress, 1.0)
        return constrainedProgress * 90
    }
}
