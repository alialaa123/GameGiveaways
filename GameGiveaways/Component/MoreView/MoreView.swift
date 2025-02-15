//
//  MoreView.swift
//  GameGiveaways
//
//  Created by ali alaa on 14/02/2025.
//

import SwiftUI
import Domain

struct MoreView: View {
    // MARK: - Properties
    @State var categories: [Giveaway]
    
    // MARK: - View
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                CustomTabVIew(
                    items: $categories,
                    width: UIScreen.main.bounds.width,
                    cardHeight: 240,
                    viewHeight: 280
                )
            }
        }
    }
}
