//
//  PermissionViewModel.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import Foundation

class PermissionViewModel {
    private let manager: PermissionManagerProtocol
    private var permissionViewDismissBlock: VoidCompletionBlock?
    
    lazy var requestPermissionListener: VoidCompletionBlock = { [weak self] in
        self?.permissionListenerHandler()
    }
    
    lazy var notNowListener: VoidCompletionBlock = { [weak self] in
        print("Dismissed.")
        self?.permissionViewDismissBlock?()
    }
    
    init(manager: PermissionManagerProtocol) {
        self.manager = manager
    }
    
    func subscribeRequestPermissionDismissed(with completion: @escaping VoidCompletionBlock) {
        permissionViewDismissBlock = completion
    }
    
    func getPermissionRequestViewData() -> PermissionRequestViewData {
        return manager.getPermissionRequestViewData(with: requestPermissionListener, with: notNowListener)
    }
    
    private func permissionListenerHandler() {
        print("permissionListenerHandler tapped")
        guard let dismissBlock = permissionViewDismissBlock else { return }
        manager.requestPermission(completion: dismissBlock)
    }
}
