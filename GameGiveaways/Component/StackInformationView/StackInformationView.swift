//
//  StackInformationView.swift
//  GameGiveaways
//
//  Created by ali alaa on 13/02/2025.
//

import SwiftUI

struct StackInformationView: View {
    // MARK: - Properties
    let informations: [StackInformation]
    
    // MARK: - View
    var body: some View {
        HStack(alignment: .center, spacing: 21) {
            addStackInformation(with: informations)
        }
        .frame(height: 60)
        .padding(.horizontal, 31)
    }
    
    // MARK: - Method Adding stack information
    @ViewBuilder
    func addStackInformation(with informations: [StackInformation]) -> some View {
        ForEach(informations) { information in
            if information != informations.first {
                Divider()
            }
            
            VStack {
                Image(systemName: information.iconImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45)
                Text(information.text)
                    .font(.system(size: 14, weight: .medium, design: .default))
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
        }
    }
}
