//
//  ContentView.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            TabView {
                ListGames()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                Favorite()
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Favorite")
                    }
                About()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("About")
                    }.tag(3)
            }.navigationTitle("List Games")
        }
    }
}
