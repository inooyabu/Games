//
//  DeveloperModel.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 04/10/21.
//

import Foundation

struct DeveloperList: Decodable {
    var results: [Developers]
}

struct Developers: Codable, Identifiable {
    let id: Int
    let name: String
    let imageBackground: String
    let games: [GameDevelopers]

    enum CodingKeys: String, CodingKey {
        case id, name, games
        case imageBackground = "image_background"
    }
}

struct GameDevelopers: Codable, Identifiable {
    let id: Int
    let name: String
}
