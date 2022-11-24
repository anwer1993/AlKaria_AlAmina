//
//  ProfileModel.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 13/11/2022.
//

import Foundation


struct ProfileModel: Codable {
    let id: Int?
    let name: String?
    let username, phone, email: String?
    let birthday, gender: String?
    let emailVerifiedAt: String?
    let picture, userType, momID: String?
    let partnerID: String?
    let deviceToken, isBanned: String?
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


struct EditProfileModel: Codable {
    var gender: Int
    var birthday: String
    var name: String
    var picture: Data?
}
