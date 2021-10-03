//
//  ApiServiceDetail.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import Foundation
import Alamofire

class ApiServiceDetail: ObservableObject {
    @Published var gameDetail = DetailGame(id: 0, name: "", backgroundImage: "", description: "", released: "", website: "", rating: 0 )
    @Published var favoriteDetail = FavoriteGameModel(backgroundImage: "", id: 0, name: "", rating: 0, rawDescription: "", released: "", website: "")
    @Published var loading = false

    private let apiKey = "?key=26024279408042a1b63ca087859e393e"
    private let apiURLBase = "https://api.rawg.io/api/games/"

    init() {
        loading = true
        loadDataByAlamofire(id: 3328)
    }

    func loadDataByAlamofire(id: Int) {
        AF.request("\(apiURLBase)\(id)\(apiKey)")
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    let detailGames = try! JSONDecoder().decode(DetailGame.self, from: data)
                    DispatchQueue.main.async {
                        self.gameDetail = detailGames
                        self.loading = false
                    }
                case .failure:
                    print("Error Connect to Server")
                }

        }
    }
}
