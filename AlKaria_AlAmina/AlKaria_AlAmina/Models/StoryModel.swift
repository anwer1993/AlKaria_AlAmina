//
//  StoryModel.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import Foundation

// MARK: - StorieModel
struct StorieModel: Codable {
    let id: Int?
    let name, subject, target, picture: String?
    let duration, startDate, endDate: String?
    let pdfLink: String?
    let sort, isDeleted: String?
    let deletedAt: String?
    let createdAt, updatedAt, pdfLink2: String?

    enum CodingKeys: String, CodingKey {
        case id, name, subject, target, picture, duration
        case startDate = "start_date"
        case endDate = "end_date"
        case pdfLink = "pdf_link"
        case sort
        case isDeleted = "is_deleted"
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pdfLink2 = "pdf_link2"
    }
}
