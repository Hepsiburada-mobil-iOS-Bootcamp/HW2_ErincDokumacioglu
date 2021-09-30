//
//  PermissionLocalizables.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 30.09.2021.
//

import Foundation

enum PermissionLocalizables: String, GenericValueProtocol {
    typealias Value = String
    
    var value: String {
        return rawValue.toLocalizedString()
    }
    
    case cameraPermissionHeader = "cameraPermissionHeader"
    case cameraPermissionBody = "cameraPermissionBody"
    case photosPermissionHeader = "photosPermissionHeader"
    case photosPermissionBody = "photosPermissionBody"
    case grantPermission = "grantPermission"
    case notNow = "notNow"
}
