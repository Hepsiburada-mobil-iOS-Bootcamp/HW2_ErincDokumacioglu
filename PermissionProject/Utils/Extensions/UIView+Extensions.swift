//
//  UIView+Extensions.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 28.09.2021.
//

import UIKit

//Animation extension
extension UIView {
    public func startPressedAnimationCommon(withDuration: CGFloat = 0.3, completion: @escaping (_ finish: Bool) -> Void) {
        self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        
        UIView.animate(
            withDuration: TimeInterval(withDuration),
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 6.0,
            options: UIView.AnimationOptions.allowUserInteraction,
            animations: {
                self.transform = CGAffineTransform.identity
            },
            completion: completion
        )
        
        self.layoutIfNeeded()
    }
}
