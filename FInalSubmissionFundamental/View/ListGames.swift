//
//  ListGames.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 03/10/21.
//

import Foundation
import SwiftUI

struct ListGames: View {
    @ObservedObject var apiService = ApiService()

    var body: some View {
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
    }
}

struct ListGames_Previews: PreviewProvider {
    static var previews: some View {
        ListGames()
    }
}
