//
//  TopScoreModel.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 17/11/2022.
//

import Foundation

// MARK: - Datum
struct ScoreModel: Codable {
    let id: Int?
    let userID, gameID, score, createdAt: String?
    let updatedAt: String?
    let game: GameModel?
    let user: UserModel?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case gameID = "game_id"
        case score
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case game, user
    }
}

// MARK: - Game
struct GameModel: Codable {
    let id: Int?
    let name: String?
    let picture: String?
    let type, createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, picture, type
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - User
struct UserModel: Codable {
    let id: Int?
    let name: String?
    let username, phone, email: String?
    let birthday, gender: String?
    let emailVerifiedAt: String?
    let picture, userType, momID: String?
    let partnerID, deviceToken: String?
    let isBanned: String?
    let code: String?
    let isDeleted: String?
    let deletedAt: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, username, phone, email, birthday, gender
        case emailVerifiedAt = "email_verified_at"
        case picture
        case userType = "user_type"
        case momID = "mom_id"
        case partnerID = "partner_id"
        case deviceToken = "device_token"
        case isBanned = "is_banned"
        case code
        case isDeleted = "is_deleted"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
