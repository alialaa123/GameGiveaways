//
//  CustomAnimatedGiveawayCard.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI
import Domain

struct CustomAnimatedGiveawayCard: View {
    // MARK: - properties
    @State var giveaway: Giveaway
    @Binding var giveawaySelected: Giveaway?
    
    /// Need offset from the scrollView in the ParentView and not taking the Global view Offset
    let coordinateSpace: String
    
    /// View aspects
    var width: CGFloat = 0
    var height: CGFloat = 300
    
    // MARK: - View
    var body: some View {
        GeometryReader {
            let size = $0.size
            let rect = $0.frame(in: .named(coordinateSpace))
            
            CustomGiveawayCard(
                giveaway: $giveaway,
                width: width == 0 ? size.width : width,
                height: height
            )
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
