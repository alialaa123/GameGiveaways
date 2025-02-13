//
//  GiveawayImage.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI

struct GiveawayImage: View {
    // MARK: - Properties
    let giveawayImageURL: URL
    let height: CGFloat
    let width: CGFloat
    
    // MARK: - View
    var body: some View {
        AsyncImage(url: giveawayImageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .frame(height: height)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width)
                    .frame(height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            default:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: width)
                    .frame(height: height)
                    .foregroundColor(.gray)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
        }
        .overlay {
            Rectangle()
                .fill(Color.black.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }
}

#Preview {
    GiveawayImage(
        giveawayImageURL: URL(string:"https://www.gamerpower.com/offers/1b/67abef5f5c31c.jpg")!,
        height: 300,
        width: UIScreen.main.bounds.width
    )
}
