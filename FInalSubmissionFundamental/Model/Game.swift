//
//  Game.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import Foundation
//cek variabel yang ndak terpakai
struct Game: Codable, Identifiable {
    let id, playtime: Int
    let name, released, backgroundImage, slug, updated: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case name, released, rating, id
        case backgroundImage = "background_image"
        case slug, playtime, updated
    }
}
