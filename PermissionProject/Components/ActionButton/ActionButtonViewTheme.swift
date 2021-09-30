//
//  ActionButtonViewTheme.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 27.09.2021.
//

import UIKit

enum ActionButtonViewTheme: GenericValueProtocol {
    typealias Value = UIColor
    
    var value: UIColor {
        switch self {
        case .smooth:
            return #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        case .bright:
            return #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        case .dark:
            return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        case .pretty:
            return #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
    }
    
    case smooth
    case dark
    case bright
    case pretty
    
}
