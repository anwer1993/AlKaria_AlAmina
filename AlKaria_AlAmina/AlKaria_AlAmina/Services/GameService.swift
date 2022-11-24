//
//  GameService.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 17/11/2022.
//

import Foundation
import Alamofire


class GameService {
    
    static var shared = GameService()
    
    func topScore(api_token: String, game_id: Int, completion: @escaping(ServerResponseModel<ScoreModel>) -> Void) {
        let params =  ["api_token": api_token,
                       "game_id": game_id] as? Parameters
        AF.request(UrlRequestEnum.TopScoreUrl.url, method: .post, parameters: params).validate().responseDecodable(of: ServerResponseModel<ScoreModel>.self) { data in
            if let data = data.value {
                completion(data)
            }
        }
    }
    
    func insertScore(api_token: String, game_id: Int, score: Int, completion: @escaping(ServerResponseModel<String>) -> Void) {
        let params =  ["api_token": api_token,
                       "game_id": game_id,
                       "score": score] as? Parameters
        AF.request(UrlRequestEnum.InsertScoreUrl.url, method: .post, parameters: params).validate().responseDecodable(of: ServerResponseModel<String>.self) { data in
            if let data = data.value {
                completion(data)
            }
        }
    }
}
