//
//  MessageResponseModel.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 28/11/2022.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let messageResponseModel = try? newJSONDecoder().decode(MessageResponseModel.self, from: jsonData)

import Foundation

// MARK: - MessageResponseModel
struct MessageResponseModel: Codable {
    let currentPage: Int?
    let data: [MessageModel]?
    let firstPageURL: String?
    let from, lastPage: Int?
    let lastPageURL: String?
    let links: [Link]?
    let nextPageURL: String?
    let path: String?
    let perPage: Int?
    let prevPageURL: String?
    let to, total: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case links
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}

// MARK: - MessageModel
struct MessageModel: Codable {
    let id: Int?
    let fromUser, toUser, message, readed: String?
    let createdAt, updatedAt: String?
    let from, to: ProfileModel?

    enum CodingKeys: String, CodingKey {
        case id
        case fromUser = "from_user"
        case toUser = "to_user"
        case message, readed
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case from, to
    }
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String?
    let active: Bool?
}

extension MessageModel {
    
    var isMine: Bool {
        return self.from?.id == AccountManager.shared.profile?.id
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-ddThh:mm:ss"
        let dateFromStrig = dateFormatter.date(from: self.createdAt ?? "") ?? Date()
        let secondFormatter = DateFormatter()
        secondFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return secondFormatter.string(from: dateFromStrig)
    }
    
}
