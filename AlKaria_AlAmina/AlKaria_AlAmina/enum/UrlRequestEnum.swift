//
//  UrlRequestEnum.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 09/11/2022.
//

import Foundation

enum UrlRequestEnum {
    
    case GET_STORIES
    case FRIENDS_LIST
    case login
    case TopScoreUrl
    case InsertScoreUrl
    case SendFeedback
    case SettingsUrl
    case SendMessage
    case EditProfile
    case Profile
    
    var url: String  {
        switch self {
        case .login:
            return "\(Utilities.baseUrl)api/v1/login/ar"
        case .GET_STORIES:
            return "\(Utilities.baseUrl)api/v1/courses/ar"
        case  .FRIENDS_LIST:
            return "\(Utilities.baseUrl)api/v1/kids/ar"
        case .TopScoreUrl:
            return "\(Utilities.baseUrl)api/v1/scores/ar"
        case .InsertScoreUrl:
            return "\(Utilities.baseUrl)api/v1/score/add/ar"
        case .SendFeedback:
            return "\(Utilities.baseUrl)api/v1/feedback/add/ar"
        case .SettingsUrl:
            return "\(Utilities.baseUrl)api/v1/setting/ar"
        case .SendMessage:
            return "\(Utilities.baseUrl)api/v1/message/add/ar"
        case .EditProfile:
            return "\(Utilities.baseUrl)api/v1/profil/edit/ar"
        case .Profile:
            return "\(Utilities.baseUrl)api/v1/profil/ar"
        }
    }
}
