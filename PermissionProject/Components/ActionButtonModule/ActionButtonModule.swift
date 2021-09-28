//
//  ActionButtonModule.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 28.09.2021.
//

import UIKit

class ActionButtonModule: GenericBaseView<ActionButtonModuleData> {
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.layer.cornerRadius = 6
        temp.clipsToBounds = true
        
        return temp
    }()
    
    private lazy var stackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [negativeButton, positiveButton])
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.axis = .horizontal
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.spacing = 20
        temp.distribution = .fill
        
        return temp
    }()
    
    private lazy var negativeButton: ActionButtonView = {
        let temp = ActionButtonView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.heightAnchor.constraint(equalToConstant: 40).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        return temp
    }()
    
    private lazy var positiveButton: ActionButtonView = {
        let temp = ActionButtonView()
        
        temp.heightAnchor.constraint(equalToConstant: 40).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    func addComponents() {
        addSubview(containerView)
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        
        guard let data = returnData() else { return }
        positiveButton.setData(data: data.positiveBtnData)
        negativeButton.setData(data: data.negativeBtnData)
    }
}
