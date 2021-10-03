//
//  GameDetail.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import SwiftUI
import URLImage
import Alamofire
import CoreData

struct GameDetail: View {
    @ObservedObject var apiServiceDetail = ApiServiceDetail()

//    @FetchRequest(entity: FavoriteGameEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \FavoriteGameEntity.id, ascending: true)]) var favorites: FetchedResults<FavoriteGameEntity>

    var idGame: Int

    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @State var isFavorite = false

    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                URLImage(URL(string: "\(apiServiceDetail.gameDetail.backgroundImage)")!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .border(Color.gray.opacity(0.5))
                        .offset(x: 0, y: 0)
                        .padding(.bottom, 0)
                        .frame(width: UIScreen.main.bounds.height/8*3, height: UIScreen.main.bounds.height/2)
                }
                HStack {
                    Text("\(apiServiceDetail.gameDetail.name)")
                        .font(.system(size: 25))
                        .bold()

                    if isFavorite {
                        Button(action: {
                            print("Ini kalau isFavorite true, trus diklik, jadinya false")
                            isFavorite = false

                            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteGameEntity")
                            fetchRequest.fetchLimit = 1
                            fetchRequest.predicate = NSPredicate(format: "id == \(apiServiceDetail.gameDetail.id)")
                            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
                            batchDeleteRequest.resultType = .resultTypeCount

                            do {
                                try self.moc.execute(batchDeleteRequest)
                                self.moc.reset()
                            } catch let error as NSError {
                                print("Errornya adalah \(error)")
                            }

                        }) {
                            Image(systemName: "heart.fill")
                        }
                    } else {
                        Button(action: {
                            print("Ini kalau isFavorite false, trus diklik, jadinya true")
                            isFavorite = true

                            let favoriteEntity = FavoriteGameEntity(context: self.moc)
                            favoriteEntity.id = Int32(apiServiceDetail.gameDetail.id)
                            favoriteEntity.name = apiServiceDetail.gameDetail.name
                            favoriteEntity.backgroundImage = apiServiceDetail.gameDetail.backgroundImage
                            favoriteEntity.released = apiServiceDetail.gameDetail.released
                            favoriteEntity.rating = apiServiceDetail.gameDetail.rating
                            favoriteEntity.website = apiServiceDetail.gameDetail.website
                            favoriteEntity.rawDescription = apiServiceDetail.gameDetail.description
                            favoriteEntity.isFavorite = isFavorite

                            do {
                                try self.moc.save()
                                print("Berhasil Save Data")
                            } catch {
                                print("Error \(error.localizedDescription)")
                            }
                        }) {
                            Image(systemName: "heart")
                        }
                    }
                }
                HStack {
                    Text("🗓")
                    Text("\(apiServiceDetail.gameDetail.released)")
                }
                HStack {
                    Text("⭐️")
                    Text("\(apiServiceDetail.gameDetail.rating.format())")
                }
                Text("Website")
                    .bold()
                Text("\(apiServiceDetail.gameDetail.website)")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "\(apiServiceDetail.gameDetail.website)")!, options: [:])
                    }
                Spacer(minLength: 10)
                Text("Description")
                    .bold()
                Text(apiServiceDetail.gameDetail.description)
            }
        }.onAppear {
            self.apiServiceDetail.loadDataByAlamofire(id: idGame)
        }
        .navigationBarTitle(Text(apiServiceDetail.gameDetail.name), displayMode: .inline)
            .padding()
    }
}

extension Double {
    func format() -> String {
        return String(format: "%.2f", self)
    }
}
