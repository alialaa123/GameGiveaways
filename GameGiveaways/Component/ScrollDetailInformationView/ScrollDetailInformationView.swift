//
//  ScrollDetailInformationView.swift
//  GameGiveaways
//
//  Created by ali alaa on 13/02/2025.
//

import SwiftUI
import Domain

struct ScrollDetailInformationView: View {
    let information: GiveawayDetailInformation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 26) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Platform")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    
                    Text(information.platforms)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Giveaway End Date")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    
                    Text(information.endDate)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Description")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    
                    Text(information.description)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                }
            }
        }
        .padding()
    }
}
