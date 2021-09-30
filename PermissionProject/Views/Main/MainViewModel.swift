//
//  MainViewModel.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import UIKit

class MainViewModel {
    private let cameraPermissionManager = PermissionManagerFactory.getCameraPermissionManager()
    private let photoPermissionManager = PermissionManagerFactory.getPhotoPermissionManager()
    
    func openCamera(with completion: BooleanBlock) {
        completion(cameraPermissionManager.checkPermission())
    }
    
    func openPhotos(with completion: BooleanBlock) {
        completion(photoPermissionManager.checkPermission())
    }
    
    func getCameraActionButtonData() -> ActionButtonViewData {
        return ActionButtonViewData(title: "Camera", type: .filled(.dark))
    }
    
    func getPhotoPermissionButtonData() -> ActionButtonViewData {
        return ActionButtonViewData(title: "Photos", type: .filled(.pretty))
    }
}
