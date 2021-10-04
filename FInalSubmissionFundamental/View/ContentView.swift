//
//  ContentView.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
//        TabView {
//            NavigationView {
//                ListGames()
//                .navigationTitle("List Games")
//            }
//            .tabItem {
//                Image(systemName: "house")
//                Text("Home")
//            }
//            NavigationView {
//                ListDeveloper()
//                    .navigationTitle("List Developer")
//            }
//            .tabItem {
//                Image(systemName: "gamecontroller.fill")
//                Text("Developer")
//            }
//            NavigationView {
//                Favorite()
//                    .navigationTitle("Favorite")
//            }
//            .tabItem {
//                Image(systemName: "suit.heart.fill")
//                Text("Favorite")
//            }
//            NavigationView {
//                About()
//                    .navigationTitle("About")
//            }
//            .tabItem {
//                Image(systemName: "person.crop.circle")
//                Text("About")
//            }
//        }

        NavigationView {
            TabView {
                ListGames()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                ListDeveloper()
                    .tabItem {
                        Image(systemName: "gamecontroller.fill")
                        Text("Developer")
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
            }.navigationTitle("Games")
        }

    }
}
