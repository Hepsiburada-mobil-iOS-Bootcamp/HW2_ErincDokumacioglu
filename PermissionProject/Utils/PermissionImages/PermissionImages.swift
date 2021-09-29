//
//  PermissionImages.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import UIKit

enum PermissionImages: String, GenericValueProtocol {
    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage.init(imageLiteralResourceName: rawValue)
    }
    
    case notif = "notif_"
    case camera = "camera_"
}
