//
//  FriendModel.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 09/11/2022.
//

import Foundation

// MARK: - FriendModel
struct FriendModel: Codable {
    let id: Int?
    let name: String?
    let username, phone: String?
    let email: String?
    let birthday: String?
    let gender, emailVerifiedAt, picture, userType: String?
    let momID: String?
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
