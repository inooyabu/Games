//
//  Game.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import Foundation

struct Game: Codable, Identifiable {
    let id: Int
    let name, released, backgroundImage: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case name, released, rating, id
        case backgroundImage = "background_image"
    }
}
