//
//  UIApplication+Extensions.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import UIKit

extension UIApplication {
    class func topViewController(
        _ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
    ) -> UIViewController? {
        
        if let navigationController = base as? UINavigationController {
            return topViewController(navigationController.visibleViewController)
        }
        
        if let tabController = base as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(selected)
            }
        }
        
        if let presentedViewController = base?.presentedViewController {
            return topViewController(presentedViewController)
        }
        
        return base
    }
}
