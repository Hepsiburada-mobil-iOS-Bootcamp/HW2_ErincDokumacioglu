//
//  BaseView.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 27.09.2021.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addMajorViewComponents()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorViewComponents()
        setupViews()
    }
    
    func addMajorViewComponents(){}
    func setupViews(){}
}
