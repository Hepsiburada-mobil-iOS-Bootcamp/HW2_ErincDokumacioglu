//
//  ActionButtonModuleData.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 28.09.2021.
//

import Foundation

class ActionButtonModuleData {
    private(set) var positiveBtnData: ActionButtonViewData
    private(set) var negativeBtnData: ActionButtonViewData
    
    init(positiveBtnData: ActionButtonViewData, negativeBtnData: ActionButtonViewData) {
        self.negativeBtnData = negativeBtnData
        self.positiveBtnData = positiveBtnData
    }
}
