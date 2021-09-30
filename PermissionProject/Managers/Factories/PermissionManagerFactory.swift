//
//  PermissionManagerFactory.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import Foundation

enum PermissionType {
    case photo
    case camera
}

class PermissionManagerFactory {
    private static let cameraManager = CameraPermissionManager()
    private static let photoManager = PhotosPermissionManager()
    
    class func getManager(with type: PermissionType) -> PermissionManagerProtocol {
        switch type {
        case .camera:
            return cameraManager
        case .photo:
            return photoManager
        }
    }
    
    class func getCameraPermissionManager() -> CameraPermissionProtocol {
        return cameraManager
    }
    
    class func getPhotoPermissionManager() -> PhotosPermissionProtocol {
        return photoManager
    }
}
