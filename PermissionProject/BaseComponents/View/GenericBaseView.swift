//
//  GenericBaseView.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 27.09.2021.
//

import UIKit

class GenericBaseView<T>: BaseView {
    private var data: T?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public init(frame: CGRect = .zero, data: T?) {
        self.data = data
        super.init(frame: frame)
        loadDataToView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadDataToView() {}
    
    func setData(data: T?) {
        self.data = data
        loadDataToView()
    }
    
    func returnData() -> T? {
        return data
    }
}
