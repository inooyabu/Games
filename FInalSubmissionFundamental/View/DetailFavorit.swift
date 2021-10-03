//
//  DetailFavorit.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import SwiftUI
import URLImage
import Alamofire
import CoreData

struct DetailFavorit: View {
    @State var isFavorite = true
    var favGameId: Int32

    @ObservedObject var apiServiceDetail = ApiServiceDetail()
    @ObservedObject var addFavoriteVM = AddFavorite()
    @ObservedObject var deleteFavoriteVM = DeleteFavorite()
    @ObservedObject var favoriteIdVM = FavoriteGameIdVM()

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

//                    if isFavorite {
                    if self.favoriteIdVM.favGame.id == 0 || self.isFavorite == false {
                        Button(action: {
                            print("Ini kalau isFavorite false, trus diklik, jadinya true")
//                            isFavorite = true
                            if self.apiServiceDetail.gameDetail.id != 0 {
                                self.addFavoriteVM.id = Int32(self.apiServiceDetail.gameDetail.id)
                                self.addFavoriteVM.name = self.apiServiceDetail.gameDetail.name
                                self.addFavoriteVM.backgroundImage = self.apiServiceDetail.gameDetail.backgroundImage
                                self.addFavoriteVM.released = self.apiServiceDetail.gameDetail.released
                                self.addFavoriteVM.rating = self.apiServiceDetail.gameDetail.rating
                                self.addFavoriteVM.website = self.apiServiceDetail.gameDetail.website
                                self.addFavoriteVM.rawDescription = self.apiServiceDetail.gameDetail.description

                                let saved = self.addFavoriteVM.addFavorite()
                                if saved {
                                    self.isFavorite = saved
                                }
                                self.favoriteIdVM.fetchFavoriteId(id: Int32(apiServiceDetail.gameDetail.id))
                            }
                        }) {
                            Image(systemName: "heart")
                        }
                    } else {
                        Button(action: {
                            if self.apiServiceDetail.gameDetail.id != 0 {
                                print("Ini kalau isFavorite true, trus diklik, jadinya false")
    //                            isFavorite = false

                                    self.deleteFavoriteVM.id = Int32(apiServiceDetail.gameDetail.id)
                                    let removed = self.deleteFavoriteVM.deleteFav()

                                    if removed == true {
                                        self.isFavorite = false
                                        print("Berhasil removed, isFavorite false")
                                    } else {
                                        self.isFavorite = true
                                        print("Removed not true, isFavorite true")
                                    }
                                    self.favoriteIdVM.fetchFavoriteId(id: Int32(apiServiceDetail.gameDetail.id))
                            }
                        }) {
                            Image(systemName: "heart.fill")
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
            self.apiServiceDetail.loadDataByAlamofire(id: Int(favGameId))
            self.favoriteIdVM.fetchFavoriteId(id: Int32(favGameId))
        }
        .navigationBarTitle(Text(apiServiceDetail.gameDetail.name), displayMode: .inline)
            .padding()
    }
}

//extension Double {
//    func format() -> String {
//        return String(format: "%.2f", self)
//    }
//}
