//
//  Favorite.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import SwiftUI

struct Favorite: View {

    @ObservedObject private var favoriteGameVM = FavoriteListViewModel()

    var body: some View {
        VStack {
            if favoriteGameVM.loading {
                ProgressView()
            } else {
                if favoriteGameVM.favoriteGame.count > 0 {
                    List(favoriteGameVM.favoriteGame, id: \.id) { favGames in
                        NavigationLink(destination: DetailFavorit(favGameId: Int32(favGames.id))) {
                            FavoriteGameRow(favGame: favGames)
                        }
                    }
                } else {
                    VStack {
                        Text("No data")
                    }.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                }
            }
        }.onAppear {
            self.favoriteGameVM.fetchFavorite()
        }
    }
}
