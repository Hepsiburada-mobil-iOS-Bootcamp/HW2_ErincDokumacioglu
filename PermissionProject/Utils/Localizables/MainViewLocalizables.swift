//
//  MainViewLocalizables.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 30.09.2021.
//

import Foundation

enum MainViewLocalizables: String, GenericValueProtocol {
    typealias Value = String
    
    var value: String {
        return rawValue.toLocalizedString()
    }
    
    case camera = "camera"
    case photos = "photos"
}
