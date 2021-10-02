//
//  ContentView.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @ObservedObject var apiService = ApiService()

    var body: some View {

        TabView {
            NavigationView {
                VStack {
                    if apiService.loading {
                        ProgressView()
                    } else {
                        List(apiService.games.results) { game in
                            NavigationLink(destination: GameDetail(idGame: game.id)) {
                                GameRow(game: game)
                            }
                        }
                    }
                }
                .navigationTitle("List Games")
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }.tag(1)
            NavigationView {
                Favorite()
                    .navigationTitle("Favorite")
            }
            .tabItem {
                Image(systemName: "suit.heart.fill")
                Text("Favorite")
            }.tag(2)
            NavigationView {
                About()
                    .navigationTitle("About")
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("About")
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
