//
//  CustomTabVIew.swift
//  GameGiveaways
//
//  Created by ali alaa on 14/02/2025.
//

import SwiftUI
import Domain

struct CustomTabVIew: View {
    // MARK: - Properties
    @Binding var items: [Giveaway]
    let width: CGFloat
    let cardHeight: CGFloat
    let viewHeight: CGFloat
    
    @State var offsetX: CGFloat = 0
    
    // MARK: - View
    var body: some View {
        TabView {
            ForEach(items.indices, id: \.self) { item in
                GeometryReader { geo in
                    if item == 0 {
                        CustomGiveawayCard(
                            giveaway: $items[item],
                            isFavoriteAvailable: false,
                            width: width,
                            height: cardHeight
                        )
                        .overlay(
                            GeometryReader{ geo in
                                let minX = geo.frame(in: .global).minX
                                withAnimation(.default) {
                                    offsetX = -minX
                                }
                                return Color.clear
                            }
                                .frame(width: 0, height: 0)
                            , alignment: .leading
                        )
                        .rotation3DEffect(
                            .degrees(geo.frame(in: .global).minX / -10),
                            axis: (x: 0, y: 1, z: 0)
                        )
                    } else {
                        CustomGiveawayCard(
                            giveaway: $items[item],
                            isFavoriteAvailable: false,
                            width: width,
                            height: cardHeight
                        )
                        .rotation3DEffect(
                            .degrees(geo.frame(in: .global).minX / -10),
                            axis: (x: 0, y: 1, z: 0)
                        )
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: viewHeight)
        .overlay(alignment: .bottom) {
            HStack(spacing: 8) {
                ForEach(items.indices, id: \.self) { item in
                    Capsule()
                        .fill(getIndex() == item ? .blue : .black)
                        .frame(width: getIndex() == item ? 20 : 7, height: 7)
                }
            }
            .padding(.bottom)
        }
    }
    
    // MARK: - Method
    /// Get `Index` from the Offset
    func getIndex() -> Int {
        let screenWidth = UIScreen.main.bounds.width
        
        return Int(round(Double(offsetX / screenWidth)))
    }
}
