//
//  ContactService.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 09/11/2022.
//

import Foundation
import Alamofire


class ContactService {
    
    static var shared = ContactService()
    
    func friendsList(api_token: String,completion: @escaping(ServerResponseModel<FriendModel>) -> Void) {
        let params =  ["api_token": api_token] as? Parameters
        AF.request(UrlRequestEnum.FRIENDS_LIST.url, method: .post, parameters: params).validate().responseDecodable(of: ServerResponseModel<FriendModel>.self) { data in
            if let data = data.value {
                completion(data)
            }
        }
    }
}
