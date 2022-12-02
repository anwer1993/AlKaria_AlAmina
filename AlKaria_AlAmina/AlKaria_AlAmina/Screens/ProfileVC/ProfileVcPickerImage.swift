//
//  ProfileVcPickerImage.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 25/11/2022.
//

import Foundation
import UIKit
import AVFoundation
import Photos

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.profileImage.isHidden = false
            self.profileAvatar.isHidden = true
            profileImage.image = image
            profileImage.contentMode = .scaleAspectFill
            self.profilePic = profileImage.image?.jpegData(compressionQuality: 0.3)
        }else{
            print("Something went wrong")
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        /*
         Get the image from the info dictionary.
         If no need to edit the photo, use `UIImagePickerControllerOriginalImage`
         instead of `UIImagePickerControllerEditedImage`
         */
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            self.profileImage.image = editedImage
            self.profileImage.isHidden = false
            self.profileAvatar.isHidden = true
        }
        dismiss(animated: true, completion: nil)
    }
    
}

extension ProfileVC {
    
    @objc func showActionSheet(_ sender: UITapGestureRecognizer? = nil) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.requestCameraAccess()
        }))
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.requestGalerieAccess()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }
    
    func camera() {
        DispatchQueue.main.async {[weak self] in
            guard let this = self else {return}
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let myPickerController = UIImagePickerController()
                myPickerController.delegate = this
                myPickerController.sourceType = .camera
                this.present(myPickerController, animated: true, completion: nil)
            }
        }
    }
    
    func photoLibrary() {
        DispatchQueue.main.async {[weak self] in
            guard let this = self else {return}
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let myPickerController = UIImagePickerController()
                myPickerController.delegate = this
                myPickerController.sourceType = .photoLibrary
                this.present(myPickerController, animated: true, completion: nil)
            }
        }
    }
    
    func requestCameraAccess() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status{
        case .authorized:
            self.camera()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.camera()
                }
            }
        case .denied, .restricted:
            showSettingAlert(title: "ACCESS_DENIED", message: "CAM_PRMISSION_DENIED")
            break
        default:
            break
        }
    }
    
    func requestGalerieAccess() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status{
        case .authorized:
            self.photoLibrary()
        case .denied, .restricted:
            showSettingAlert(title: "ACCESS_DENIED", message: "PHOTOS_PRMISSION_DENIED")
            break
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == PHAuthorizationStatus.authorized{
                    self.photoLibrary()
                }
            })
        default:
            break
        }
    }
    
}


