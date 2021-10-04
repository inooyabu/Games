//
//  ApiSearch.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 03/10/21.
//

import Foundation
import Alamofire

class ApiDeveloper: ObservableObject {
    @Published var developers = DeveloperList(results: [])
    @Published var loading = false
    private let apiKey = "26024279408042a1b63ca087859e393e"
    private let apiURLBase = "https://api.rawg.io/api/developers?key="

    init() {
        loading = true
        loadDataDeveloper()
    }

    private func loadDataDeveloper() {
        AF.request("\(apiURLBase)\(apiKey)")
            .responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    let developers = try! JSONDecoder().decode(DeveloperList.self, from: data)
                    DispatchQueue.main.async {
                        self.developers = developers
                        self.loading = false
                    }
                case .failure:
                    print("Error Connect to Server")
                }

        }
    }
}
