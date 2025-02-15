//
//  ScrollDetailInformationView.swift
//  GameGiveaways
//
//  Created by ali alaa on 13/02/2025.
//

import SwiftUI
import Domain

struct ScrollDetailInformationView: View {
    // MARK: - Properties
    let information: GiveawayDetailInformation
    
    // MARK: - View
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 26) {
                createStackOfInformation(with: "Platform", and: information.platforms)
                
                createStackOfInformation(with: "Giveaway End Date", and: information.endDate)
                
                createStackOfInformation(with: "Description", and: information.description)
            }
        }
        .padding()
    }
    
    // MARK: - Method
    /// Creating stack of information
    func createStackOfInformation(with title: String, and value: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 16, weight: .bold, design: .rounded))
            
            Text(value)
                .font(.system(size: 14, weight: .regular, design: .rounded))
        }
    }
}
