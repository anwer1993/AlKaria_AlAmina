//
//  ServerResponseModel.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import Foundation

struct ServerResponseModel<T>: Codable where T: Codable {
    var message: String?
    var result: Bool?
    var data: [T]?
}

struct ServerDataResponseModel<T>: Codable where T: Codable {
    var message: String?
    var result: Bool?
    var data: T?
}

struct LoginServerDataResponseModel: Codable {
    var message: String?
    var result: Bool?
    var api_token: String?
    var data: ProfileModel?
}


