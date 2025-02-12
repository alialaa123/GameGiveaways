//
//  ContentView.swift
//  GameGiveaways
//
//  Created by ali alaa on 12/02/2025.
//

import SwiftUI
import Domain
import Data
import NetworkLayer

struct ContentView: View {
    @StateObject var viewModel: ListOfGiveawaysViewModel

    var body: some View {
        VStack {
            List(viewModel.giveaways, id: \.id) {
                Text("\($0.title)")
            }
        }
        .padding()
    }
}
