//
//  FavoriteListViewModel.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 03/10/21.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    
    @Published var favoriteGame = [FavoriteViewModel]()
    @Published var loading: Bool = false

    init() {
        fetchFavorite()
    }

    func fetchFavorite() {
        self.loading = true
        DispatchQueue.main.async {
            self.loading = false
            self.favoriteGame = FavManager.shared.getFavorite().map(FavoriteViewModel.init)
        }
    }
}
