//
//  RouterManager.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 01/11/2022.
//

import Foundation
import UIKit

/// Class responsible for the routing functionality
struct Router: IRouter {
    
    struct Static {
        static let sharedInstance = Router()
    }
    
    static var shared = Static.sharedInstance
    
    static func updateRootVC(selectedIndex: Int) {
        let status: Bool?
        var rootVC : UIViewController?
        
        if let token = AccountManager.shared.token, !token.isEmpty {
            status = true
        }else {
            status = false
        }
        
        if(status == false){
            guard let rootVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabbarVc") as? MainTabbarVc else {return}
            rootVc.selectedIndex = selectedIndex
            rootVC = rootVc
        } else{
            rootVC = UIStoryboard(name: "Authentication", bundle: nil).instantiateViewController(withIdentifier: "SplachScreen") as? SplachScreen
        }
        
        guard let root = rootVC else {return }
        
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        let nav = UINavigationController(rootViewController: root)
        window?.rootViewController = nav
    }
    
    /// Get the top view controller in the app
    var topVC: UIViewController? {
        if var topController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController  {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    
    /// Instantiate the view controller and prepare it for the navigation
    /// - Parameters:
    ///   - screen: the app screen that we will navigate to it
    ///   - modalePresentatioinStyle: the prsentation style
    /// - Returns: return the corresponding view controller for the current screen
    private func viewControllerForNavigation(screen: INaviagtion, modalePresentatioinStyle: UIModalPresentationStyle?) -> UIViewController {
        var viewController = UIViewController()
        if let screen = screen as? AppScreen {
            switch screen {
            case .Login:
                guard let vc = LoginVc.instantiate(storyboardName: "Authentication") else {return UIViewController()}
                viewController = vc
                break
            case .ForgotPassword:
                guard let vc = ForgotPasswordVc.instantiate(storyboardName: "Authentication") else {return UIViewController()}
                viewController = vc
                break
            case .OTPScreen:
                guard let vc = OTPVc.instantiate(storyboardName: "Authentication") else {return UIViewController()}
                viewController = vc
                break
            case .ResetForgotPassword:
                guard let vc = ResetForgotPasswordVc.instantiate(storyboardName: "Authentication") else {return UIViewController()}
                viewController = vc
            case .Register:
                guard let vc = RegisterVc.instantiate(storyboardName: "Authentication") else {return UIViewController()}
                viewController = vc
                break
            case .Home:
                guard let vc = HomeVc.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .Tabbar(selectedIndex: let selectedIndex):
                guard let vc = MainTabbarVc.instantiate(storyboardName: "Main") else {return UIViewController()}
                vc.selectedIndex = selectedIndex
                viewController = vc
                break
            case .Game:
                guard let vc = GamesVc.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .Friends:
                guard let vc = FriendsVc.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .Partenars:
                guard let vc = PartenarsVc.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .Stories:
                guard let vc = StoriesVc.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .Profile:
                guard let vc = ProfileVC.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .ContactUs:
                guard let vc = ContactUsVc.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            case .LireStory(url: let url):
                guard let vc = StoryWebViewVc.instantiate(storyboardName: "Main") else {return UIViewController()}
                vc.url = url
                viewController = vc
                break
            case .Puzzle(game: let game):
                guard let vc = PuzzleGameVc.instantiate(storyboardName: "Main") else {return UIViewController()}
                vc.game = game
                viewController = vc
                break
            case .ListPuzzle:
                guard let vc = PuzzleGameListVc.instantiate(storyboardName: "Main") else {return UIViewController()}
                viewController = vc
                break
            }
        }
        if modalePresentatioinStyle != nil {
            viewController.modalPresentationStyle = modalePresentatioinStyle!
        }
        return viewController
    }
    
    /// present View controller
    /// - Parameters:
    ///   - screen: the corresponding screen
    ///   - modalePresentatioinStyle: the presentation style
    ///   - completion: completion handled when present the view controller
    func present(screen: AppScreen, modalePresentatioinStyle: UIModalPresentationStyle, completion: (() -> Void)?) {
        DispatchQueue.main.async {
            if let topVC = self.topVC {
                topVC.present(self.viewControllerForNavigation(screen: screen, modalePresentatioinStyle: modalePresentatioinStyle), animated: false, completion:{
                    if completion != nil {
                        completion!()
                    }
                })
            }
        }
    }
    
    /// push view controller
    /// - Parameters:
    ///   - navigationController: the navigation controller that will push the view controller
    ///   - screen: the screen we will push it
    ///   - animated: the animation value
    func push(with navigationController: UINavigationController?, screen: AppScreen, animated: Bool) {
        DispatchQueue.main.async {
            navigationController?.pushViewController(self.viewControllerForNavigation(screen: screen, modalePresentatioinStyle: nil), animated: animated)
        }
    }
    
    /// Dismiss to root view Controller
    /// - Parameter completion: Completion handled when dismiss to the root view controller
    func dismissToRootViewController(completion: @escaping () -> Void) {
        topVC?.view.window?.rootViewController?.dismiss(animated: false, completion: {
            completion()
        })
    }
}
