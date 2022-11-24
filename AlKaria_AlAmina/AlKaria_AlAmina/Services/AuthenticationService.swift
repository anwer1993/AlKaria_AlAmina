//
//  AuthenticationService.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 08/11/2022.
//

import Foundation
import Alamofire


class Authentication {
    
    static var shared = Authentication()
    
    func getStories(completion: @escaping(ServerResponseModel<StorieModel>) -> Void) {
        AF.request(UrlRequestEnum.GET_STORIES.url, method: .get).validate().responseDecodable(of: ServerResponseModel<StorieModel>.self) { data in
            if let data = data.value {
                completion(data)
            }
        }
    }
    
    func getSettings(completion: @escaping(ServerDataResponseModel<SettingsModel>) -> Void) {
        AF.request(UrlRequestEnum.SettingsUrl.url, method: .get).validate().responseDecodable(of: ServerDataResponseModel<SettingsModel>.self) { data in
            if let data = data.value {
                completion(data)
            }
        }
    }
    
    func login(user_name: String, password: String, completion: @escaping(LoginServerDataResponseModel) -> Void) {
        let params =  ["username": user_name,
                       "password": password] as? Parameters
        AF.request("https://safer-kids.net/public/api/v1/login/ar", method: .post, parameters: params).validate().responseDecodable(of: LoginServerDataResponseModel.self) { data in
            if let data = data.value {
                completion(data)
            } else {
                let loginServerResponse = LoginServerDataResponseModel(message: "الرجاء التثبت من البيانات")
                completion(loginServerResponse)
            }
        }
    }
    
    func getProfile(api_token: String, user_id: Int, completion: @escaping(ServerDataResponseModel<ProfileModel>) -> Void) {
        let params =  ["api_token": api_token,
                       "user_id": "\(user_id)"] as? Parameters
        AF.request(UrlRequestEnum.Profile.url, method: .post, parameters: params).validate().responseDecodable(of: ServerDataResponseModel<ProfileModel>.self) { data in
            if let data = data.value {
                completion(data)
            } 
        }
    }
    
    func sendFeedback(api_token: String, response_1: String, response_2: String, response_3: String, completion: @escaping(ServerResponseModel<String>) -> Void) {
        let params =  ["api_token": api_token,
                       "response_1": response_1,
                       "response_2": response_2,
                       "response_3": response_3] as? Parameters
        AF.request(UrlRequestEnum.SendFeedback.url, method: .post, parameters: params).validate().responseDecodable(of: ServerResponseModel<String>.self) { data in
            if let data = data.value {
                completion(data)
            }
        }
    }
    
    func editProfile(newModel: EditProfileModel, api_token: String, completion: @escaping(ServerResponseModel<ProfileModel>) -> Void) {
        let parameters = ["api_token": api_token,
                          "gender": "\(newModel.gender)",
                          "birthday": newModel.birthday,
                          "name": newModel.name]
        AF.upload(multipartFormData: { multipartFormData in
            parameters.forEach { (key: String, value: String) in
                multipartFormData.append(value.data(using: .utf8) ?? Data(), withName: key)
            }
            if let picture = newModel.picture {
                multipartFormData.append(picture, withName: "picture", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
            }
            
        }, to: UrlRequestEnum.EditProfile.url, method: .post)
        .validate()
        .responseDecodable(of: ServerResponseModel<ProfileModel>.self.self) { data in
            if let data = data.value {
                completion(data)
            }
        }
    }
    
    
}
