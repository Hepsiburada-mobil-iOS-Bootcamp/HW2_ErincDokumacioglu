//
//  InfoView.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 28.09.2021.
//

import UIKit

class InfoView: GenericBaseView<InfoViewData> {
    private lazy var stackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [header, body])
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        
        return temp
    }()
    
    private lazy var header: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.font = FontManager.bold(20).value
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .center
        
        return temp
    }()
    
    private lazy var body: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.font = FontManager.regular(15).value
        temp.textColor = .black
        temp.text = " "
        temp.lineBreakMode = .byWordWrapping
        temp.numberOfLines = 0
        temp.contentMode = .center
        temp.textAlignment = .center
        
        return temp
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    func addComponents() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        
        guard let data = returnData() else { return }
        header.text = data.header
        body.text = data.body
    }
}
