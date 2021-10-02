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
                        NavigationLink(destination: DetailFavorit()) {
                            Text(favoriteGame.name!)
                        }
                    }
                }
//                .onDelete(perform: deleteUser(at:))
//                .edgesIgnoringSafeArea(.all)
                if favorites.count == 0 {
                    Text("No data found")
                }
            }
            .listStyle(GroupedListStyle())
            }
        }



struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        Favorite()
    }
}
