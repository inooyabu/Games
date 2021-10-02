//
//  GameDetail.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import SwiftUI
import URLImage
import Alamofire

struct GameDetail: View {
    @ObservedObject var apiServiceDetail = ApiServiceDetail()

    var idGame: Int

    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

//    @State var isFavorite = true
    @State private var statName = ""
    @State private var statReleased = ""
    @State private var statWebsite = ""
    @State private var description = ""
    @State private var statId = 0
    @State private var statRating = 0
    @State private var statBackgroundImage = ""
    @State private var isFavorite = true

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
//                        Image(systemName: "heart.fill")
//                            .foregroundColor(.red)
                        Button(action: {
                            isFavorite = false
                        }) {
                            Image(systemName: "heart.fill")
                        }
                    } else {
                        Button(action: {
                            let favoriteEntity = FavoriteGameEntity(context: self.moc)
                            favoriteEntity.id = Int32(apiServiceDetail.gameDetail.id)
                            favoriteEntity.name = apiServiceDetail.gameDetail.name
                            favoriteEntity.backgroundImage = apiServiceDetail.gameDetail.backgroundImage
                            favoriteEntity.released = apiServiceDetail.gameDetail.released
                            favoriteEntity.rating = apiServiceDetail.gameDetail.rating
                            favoriteEntity.website = apiServiceDetail.gameDetail.website
                            favoriteEntity.rawDescription = apiServiceDetail.gameDetail.description
                            favoriteEntity.isFavorite = true

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

