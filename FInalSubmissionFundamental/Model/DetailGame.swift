//
//  DetailGame.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//

import Foundation

struct DetailGame: Codable, Identifiable {
    let id: Int
    let name, backgroundImage, description, released, website: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case name, website, id, released, rating
        case backgroundImage = "background_image"
        case description = "description_raw"
    }
}
