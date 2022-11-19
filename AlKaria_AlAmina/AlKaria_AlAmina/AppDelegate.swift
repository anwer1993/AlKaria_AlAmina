//
//  AppDelegate.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 01/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    var board : FifteenBoard? // Since both the Board View and the View Controller will want access to this object, let the AppDelegate object own it
    let numShuffles = 150

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.board = FifteenBoard()
        self.board!.scramble(numTimes: numShuffles)
        
        // Override point for customization after application launch.
        let mainStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        // rootViewController
        let rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "SplachScreen")
        // navigationController
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.isNavigationBarHidden = true // or not, your choice.
        // self.window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        return true
    }


}

