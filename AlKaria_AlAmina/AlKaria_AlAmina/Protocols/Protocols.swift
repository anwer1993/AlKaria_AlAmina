//
//  Protocols.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 01/11/2022.
//

import Foundation
import UIKit

/// Protocol use to instantiate view controller from storyboard
protocol Storyboarded {
    static func instantiate(storyboardName: String) -> Self?
}

extension Storyboarded where Self: UIViewController {
    
    /// instantiate view controller from storyboard
    /// - Parameter storyboardName: storyboard name
    /// - Returns: return the view controller instantiated
    static func instantiate(storyboardName: String) -> Self? {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        // load our storyboard
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as? Self
    }
}

protocol Navigatable {
    func backToPreviousViewController()
}

/// Protocol handle the router functionality
protocol IRouter {
    func present(screen: AppScreen, modalePresentatioinStyle: UIModalPresentationStyle, completion: (() -> Void)?)
    func push(with navigationController: UINavigationController?, screen: AppScreen, animated: Bool)
    var topVC: UIViewController? {get}
}

/// Protocol to handle the app's screens
protocol INaviagtion{}

protocol SubViewConroller: UIViewController {
    
    var handleTapWhenDismiss: () -> Void {get set}
    
}


protocol LireStoryDelegate {
    func lireStory(story: StorieModel)
}

protocol PlayGameDelegate {
    func play(index: Int?)
}
