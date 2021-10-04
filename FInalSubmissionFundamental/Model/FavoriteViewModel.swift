//
//  FavoriteViewModel.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 03/10/21.
//

import Foundation

class FavoriteViewModel {
    var favGameEntity: FavoriteGameEntity

    init(favGameEntity: FavoriteGameEntity) {
        self.favGameEntity = favGameEntity
    }

    var id: Int32 {
        self.favGameEntity.id
    }

    var backroundImage: String {
        self.favGameEntity.backgroundImage ?? ""
    }

    var name: String {
        self.favGameEntity.name ?? ""
    }

    var rating: Double {
        self.favGameEntity.rating
    }

    var released: String {
        self.favGameEntity.released ?? ""
    }

    var website: String {
        self.favGameEntity.website ?? ""
    }

    var rawDescription: String {
        self.favGameEntity.rawDescription ?? ""
    }
}

class AddFavorite: ObservableObject {
    var id: Int32 = 0
    var name: String = ""
    var backgroundImage: String = ""
    var website: String = ""
    var rating: Double = 0
    var released: String = ""
    var rawDescription: String = ""

    private var favGameEntity: FavoriteGameEntity {
        let favGame = FavoriteGameEntity(context: FavManager.shared.moc)

        favGame.id = id
        favGame.name = name
        favGame.backgroundImage = backgroundImage
        favGame.website = website
        favGame.rating = rating
        favGame.released = released
        favGame.rawDescription = rawDescription
        return favGame
    }

    func addFavorite() -> Bool {
        do {
            try FavManager.shared.addFavorite(favoriteGame: favGameEntity)
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
}

class FavoriteGameIdVM: ObservableObject {
    @Published var favGame = FavoriteGameModel(backgroundImage: "", id: 0, name: "", rating: 0, rawDescription: "", released: "", website: "")
    @Published var loading: Bool = false

    func fetchFavoriteId(id: Int32) {
        self.loading = true
        FavManager.shared.getFavoriteId(id) { favGame in
            self.loading = false
            guard let favGame = favGame else { return }
            self.favGame = favGame
        }
    }
}

class DeleteFavorite: ObservableObject {
    var id: Int32 = 0
    func deleteFav() -> Bool {
        do {
            try FavManager.shared.deleteFavorite(id: id)
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
}
