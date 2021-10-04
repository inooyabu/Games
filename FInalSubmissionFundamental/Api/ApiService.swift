//
//  ApiService.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import Foundation
import Alamofire

class ApiService: ObservableObject {
    @Published var games = GameList(results: [])
    @Published var loading = false
    private let apiKey = "26024279408042a1b63ca087859e393e"
    private let apiURLBase = "https://api.rawg.io/api/games?key="

    init() {
        loading = true
        loadDataByAlamofire()
    }

    func loadDataByAlamofire() {
        AF.request("\(apiURLBase)\(apiKey)")
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    let games = try! JSONDecoder().decode(GameList.self, from: data)
                    DispatchQueue.main.async {
                        self.games = games
                        self.loading = false
                    }
                case .failure:
                    print("Error Connect to Server")
                }

        }
    }
}
