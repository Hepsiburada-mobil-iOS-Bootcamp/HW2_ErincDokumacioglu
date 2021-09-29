//
//  PermissionRequestViewData.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 28.09.2021.
//

import UIKit

class PermissionRequestViewData {
    private(set) var actionButtonModuleData: ActionButtonModuleData
    private(set) var infoViewData: InfoViewData
    private(set) var image: UIImage
    
    init(actionButtonModuleData: ActionButtonModuleData,
         infoViewData: InfoViewData,
         image: UIImage) {
        self.actionButtonModuleData = actionButtonModuleData
        self.infoViewData = infoViewData
        self.image = image
    }
}
