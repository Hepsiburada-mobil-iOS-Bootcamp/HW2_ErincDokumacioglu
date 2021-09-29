//
//  PermissionRequestView.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 28.09.2021.
//

import UIKit

class PermissionRequestView: GenericBaseView<PermissionRequestViewData> {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [image, infoView, actionModule])
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        
        return temp
    }()
    
    private lazy var image: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.contentMode = .scaleAspectFill
        
        return temp
    }()
    
    private lazy var infoView: InfoView = {
        let temp = InfoView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        return temp
    }()
    
    private lazy var actionModule: ActionButtonModule = {
        let temp = ActionButtonModule()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        setupLayerConfigurations()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    func addComponents(){
        addSubview(containerView)
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 60),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -60),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    private func setupLayerConfigurations() {
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        
        guard let data = returnData() else { return }
        image.image = data.image
        infoView.setData(data: data.infoViewData)
        actionModule.setData(data: data.actionButtonModuleData)
    }
}
