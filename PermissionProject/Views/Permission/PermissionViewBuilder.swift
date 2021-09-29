//
//  PermissionViewBuilder.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import UIKit

class PermissionViewBuilder {
    class func build(with type: PermissionType) -> UIViewController {
        let viewModel = PermissionViewModel(manager: PermissionManagerFactory.getManager(with: type))
        let viewController = PermissionViewController(viewModel: viewModel)
        return viewController
    }
}
