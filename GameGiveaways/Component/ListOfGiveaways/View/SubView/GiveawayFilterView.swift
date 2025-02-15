//
//  GiveawayFilterView.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI

struct GiveawayFilterView: View {
    // MARK: - Properties
    @Binding var selectedPlatform: PlatformCategories
    
    // MARK: - View
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(PlatformCategories.allCases, id: \.self) { platformCategory in
                    Button {
                        selectedPlatform = platformCategory
                    } label: {
                        if platformCategory == .more {
                            Text(platformCategory.rawValue.capitalized)
                                .underline()
                                .font(.system(size: 12, weight: .regular, design: .monospaced))
                        } else {
                            Text(platformCategory.rawValue)
                                .font(selectedPlatform == platformCategory
                                      ? .system(size: 12, weight: .bold, design: .monospaced)
                                      : .system(size: 12, weight: .light, design: .monospaced))
                                .foregroundColor(.black)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GiveawayFilterView(selectedPlatform: .constant(PlatformCategories.all))
}
