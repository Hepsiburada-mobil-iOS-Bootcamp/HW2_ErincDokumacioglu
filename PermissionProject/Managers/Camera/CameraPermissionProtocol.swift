//
//  CameraPermissionProtocol.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import Foundation

protocol CameraPermissionProtocol: PermissionManagerProtocol {
    func checkPermission() -> Bool
}
