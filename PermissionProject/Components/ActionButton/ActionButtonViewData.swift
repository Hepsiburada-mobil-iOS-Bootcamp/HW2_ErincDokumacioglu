//
//  ActionButtonViewData.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 27.09.2021.
//

import UIKit

typealias VoidCompletionBlock = () -> Void

class ActionButtonViewData {
    private(set) var title: String
    private(set) var type: ActionButtonViewType
    private(set) var actionListener: VoidCompletionBlock?
    
    init(title: String, type: ActionButtonViewType) {
        self.title = title
        self.type = type
    }
    
    func setActionListener(listener: @escaping VoidCompletionBlock) -> Self {
        actionListener = listener
        return self
    }
}
