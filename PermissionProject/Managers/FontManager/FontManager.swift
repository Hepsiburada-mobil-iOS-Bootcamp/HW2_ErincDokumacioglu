//
//  FontManager.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 27.09.2021.
//

import UIKit

enum FontManager: GenericValueProtocol {
    typealias Value = UIFont
    
    var value: UIFont {
        switch self {
        case .bold(let fontSize):
            return UIFont.systemFont(ofSize: fontSize , weight: .bold)
        case .regular(let fontSize):
            return UIFont.systemFont(ofSize: fontSize , weight: .regular)
        case .light(let fontSize):
            return UIFont.systemFont(ofSize: fontSize , weight: .light)
        }
    }
    
    case bold(CGFloat)
    case light(CGFloat)
    case regular(CGFloat)
}
