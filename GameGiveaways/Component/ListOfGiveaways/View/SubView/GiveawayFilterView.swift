//
//  GiveawayFilterView.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI

struct GiveawayFilterView: View {
    @Binding var selectedPlatform: PlatformCategories
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(PlatformCategories.allCases, id: \.self) { platformCategory in
                    Button {
                        selectedPlatform = platformCategory
                    } label: {
                        Text(platformCategory.rawValue)
                            .font(selectedPlatform == platformCategory
                                  ? .system(size: 12, weight: .bold, design: .monospaced)
                                  : .system(size: 12, weight: .light, design: .monospaced))
                            .foregroundColor(.black)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                    }
                }
                
                Button {
                    // TODO: - Action for MORE
                } label: {
                    Text("More")
                        .underline()
                        .font(.system(size: 12, weight: .regular, design: .monospaced))
                }
            }
        }
        
    }
}

#Preview {
    GiveawayFilterView(selectedPlatform: .constant(PlatformCategories.all))
}
