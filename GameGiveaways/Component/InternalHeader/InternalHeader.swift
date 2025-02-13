//
//  InternalHeader.swift
//  GameGiveaways
//
//  Created by ali alaa on 13/02/2025.
//

import SwiftUI

enum InternalHeaderAction {
    case close
    case back
}

struct InternalHeader: View {
    // MARK: - Properties
    @Binding var isDismiss: Bool
    @Binding var isFavorite: Bool
    /// show navigation action button
    let navigationAction: InternalHeaderAction = .back
    
    // MARK: - View
    var body: some View {
        HStack(alignment: .center) {
            Button {
                isDismiss = true
            } label: {
                Image(systemName: navigationAction == .back ? "arrow.left" : "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundStyle(.black)
            }
            .frame(width: 40, height: 40)
            .background(.white)
            .clipShape(Circle())
            .offset(x: 0, y: 70)
            
            Spacer()
            
            Button {
                isFavorite.toggle()
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundStyle(.white)
            }
            .frame(width: 40, height: 40)
            .offset(x: 0, y: 70)
        }
        .padding(.horizontal)
        
    }
}
