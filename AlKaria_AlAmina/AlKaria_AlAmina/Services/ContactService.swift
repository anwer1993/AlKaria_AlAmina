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
    
    func sendMessage(api_token: String, user_id: Int, message: String,completion: @escaping(ServerResponseModel<String>) -> Void) {
        let params =  ["api_token": api_token,
                       "user_id": user_id,
                       "message": message] as? Parameters
        AF.request(UrlRequestEnum.SendMessage.url, method: .post, parameters: params).validate().responseDecodable(of: ServerResponseModel<String>.self) { data in
            if let data = data.value {
                completion(data)
            }
        }
    }
    
    func fetchMessages(api_token: String, user_id: Int,completion: @escaping(ServerDataResponseModel<MessageResponseModel>) -> Void){
        let params =  ["api_token": api_token,
                       "user_id": user_id] as? Parameters
        AF.request(UrlRequestEnum.GetMessages.url, method: .post, parameters: params).validate().responseDecodable(of: ServerDataResponseModel<MessageResponseModel>.self) { data in
            if let data = data.value {
                completion(data)
            }
        }
    }
}
