//
//  AppScreenEnum.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 01/11/2022.
//

import Foundation

/// the enumaration that define the different view controller in the app
enum AppScreen: INaviagtion{
    case Login
    case ForgotPassword
    case OTPScreen
    case ResetForgotPassword
    case Register
    case Home
    case Tabbar(selectedIndex: Int)
    case Game
    case Friends
    case Partenars
    case Profile
    case Stories
    case ContactUs
    case LireStory(url: String)
    case ListPuzzle
    case Puzzle(game: GameEnum)
    case ColoringGameList
    case ColoringGame
    case ColorDifferentGame
    case ScoreScreen(score: Int, bestScore: Int)
}
