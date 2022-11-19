//
//  UIViewControllerExtension.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 03/11/2022.
//

import Foundation
import UIKit

extension UIViewController {

    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: "خطأ", message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "تمام ", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showSuccessAlert(for alert: String) {
        let alertController = UIAlertController(title: "نجاح", message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "تمام ", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showSettingAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController (title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "CANCEL", style: .destructive, handler: nil)
            let settingsAction = UIAlertAction(title: "SETTINGS", style: .default) { action in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        print("Settings opened: \(success)")
                    })
                }
            }
            alertController.addAction(cancelAction)
            alertController.addAction(settingsAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func addChildVc(_ childVc: SubViewConroller, onDismiss: @escaping () -> Void) {
        childVc.handleTapWhenDismiss = {
            onDismiss()
        }
        self.addChild(childVc)
        self.view.addSubview(childVc.view)
        childVc.didMove(toParent: self)
        let leading = childVc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailing = childVc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let top = childVc.view.topAnchor.constraint(equalTo: view.topAnchor)
        let bottom = childVc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        NSLayoutConstraint.activate([leading, trailing, top, bottom])
        childVc.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func showLoader() {
        DispatchQueue.main.async {
            let frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
            let loader = LoaderView(frame: frame)
            loader.tag = Utilities.loaderViewTag
            self.view.addSubview(loader)
            loader.backgroundColor = .clear
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.view.subviews.forEach { view in
                if view.tag == Utilities.loaderViewTag {
                    view.removeFromSuperview()
                }
            }
        }
    }
    
    func getProfile() {
        if let token = AccountManager.shared.token, let id = AccountManager.shared.profile?.id {
            Authentication.shared.getProfile(api_token: token, user_id: id) { res in
                if let data = res.data, res.result == true {
                    AccountManager.shared.profile = data
                }
            }
        }
    }
    
    func getSettings() {
        Authentication.shared.getSettings { res in
            if let data = res.data, res.result == true {
                AccountManager.shared.settingsModel = data
            }
        }
    }
    
    
}
