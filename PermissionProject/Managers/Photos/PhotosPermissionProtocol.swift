//
//  PhotosPermissionProtocol.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import PhotosUI
import Combine
import SwiftUI
import Foundation

protocol PhotosPermissionProtocol: PermissionManagerProtocol {
    func checkPermission() -> Bool
    
    func subscribePhotosStatusObject(with completion: @escaping BooleanBlock) -> AnyCancellable
}
