//
//  MainAppHeader.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI

struct MainAppHeader: View {
    // MARK: - Properties
    let userName: String
    let headerTitle: String
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("👋🏻")
                    Text("Hello, \(userName)")
                        .font(.custom("Poppins-Medium", size: 16))
                }
                
                Spacer()
                
                Image(systemName: "person.crop.circle.badge")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
            }
            
            Text(headerTitle)
                .font(.system(size: 31, weight: .bold, design: .rounded))
        }
    }
}
#Preview {
    MainAppHeader(
        userName: "Ali",
        headerTitle: "Explore \nGames Giveaways"
    )
}
