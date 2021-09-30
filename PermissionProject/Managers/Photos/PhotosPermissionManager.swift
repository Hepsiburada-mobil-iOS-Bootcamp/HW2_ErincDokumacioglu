//
//  PhotosPermissionManager.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import Foundation
import SwiftUI
import Combine
import PhotosUI

typealias BooleanBlock = (Bool) -> Void

class PhotosPermissionManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PhotosPermissionProtocol {
    
    private let photosStatusSubject = PassthroughSubject<Bool, Never>()
    
    private let pickerController = UIImagePickerController()
    private var selectedImage: ((Image) -> Void)?
    
    override init() {
        super.init()
        pickerController.delegate = self
    }
    
    func subscribePhotosStatusObject(with completion: @escaping BooleanBlock) -> AnyCancellable {
        return photosStatusSubject.sink(receiveValue: completion)
    }
    
    func requestPermission(completion: @escaping VoidCompletionBlock) {
        print("\(#function) : PhotosPermissionManager")
        
        PHPhotoLibrary.requestAuthorization { status in
            print("Photo access status: \(status)")
            self.handleRequestAuthorization(with: status)
            completion()
        }
    }
    
    func selectPhoto(completion: @escaping (Image) -> Void) {
        selectedImage = completion
        guard let topMostViewController = UIApplication.topViewController() else { return }
        topMostViewController.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        selectedImage?(Image(uiImage: tempImage))
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    func checkPermission() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus()
        return (status == .authorized || status == .limited)
    }
    
    func getPermissionRequestViewData(with positiveCompletion: @escaping VoidCompletionBlock,
                                      with negativeCompletion: @escaping VoidCompletionBlock) -> PermissionRequestViewData {
        
        return PermissionRequestViewData(actionButtonModuleData: ActionButtonModuleData(
                                            positiveBtnData: ActionButtonViewData(title: PermissionLocalizables.grantPermission.value, type: .filled(.bright))
                                                .setActionListener(listener: positiveCompletion),
                                            negativeBtnData: ActionButtonViewData(title: PermissionLocalizables.notNow.value, type: .outlined(.bright))
                                                .setActionListener(listener: negativeCompletion)),
                                         infoViewData: InfoViewData(header: PermissionLocalizables.photosPermissionHeader.value,
                                                                    body: PermissionLocalizables.photosPermissionBody.value),
                                         image: PermissionImages.notif.value)
    }
    
    private func handleRequestAuthorization(with value: PHAuthorizationStatus) {
        photosStatusSubject.send((value == .authorized || value == .limited))
    }
}
