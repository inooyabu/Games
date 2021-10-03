//
//  Favorite.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import SwiftUI

struct Favorite: View {
    @Environment(\.managedObjectContext) var moc

    @FetchRequest(entity: FavoriteGameEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FavoriteGameEntity.id, ascending: true)]) var favorites: FetchedResults<FavoriteGameEntity>

    var body: some View {
        NavigationView {
            List {
                ForEach(favorites, id: \.self) { favoriteGame in
                    NavigationLink(destination: DetailFavorit(fav: favoriteGame.name!)) {
                            Text(favoriteGame.name!)
                        }
                }
                .onDelete(perform: deleteFavorite(at:))
                if favorites.count == 0 {
                    Text("No data found")
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
//Soon Delete
    func deleteFavorite(at offsets: IndexSet) {
        for index in offsets {
            let favorite = favorites[index]
            moc.delete(favorite)
            print("Delete \(favorite)")
        }
        try? moc.save()
    }
}


struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        Favorite()
    }
}
