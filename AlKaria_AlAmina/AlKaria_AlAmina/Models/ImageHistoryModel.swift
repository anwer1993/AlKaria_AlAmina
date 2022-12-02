//
//  ImageHistoryModel.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 27/11/2022.
//

import Foundation

struct ImageHistoryModel: Codable {
    let id: Int?
    let userID, gameID, picture, createdAt: String?
    let updatedAt: String?
    let game: GameModel?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case gameID = "game_id"
        case picture
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case game
    }
}
