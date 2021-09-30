//
//  ActionButton.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 27.09.2021.
//

import UIKit

class ActionButtonView: GenericBaseView<ActionButtonViewData> {
    private lazy var shadowView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.backgroundColor = .white
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.4
        temp.layer.cornerRadius = 6
        
        return temp
    }()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.layer.cornerRadius = 6
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        
        return temp
    }()
    
    private lazy var title: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.font = FontManager.bold(14).value
        temp.textColor = .black
        temp.text = "asdasdad"
        temp.contentMode = .center
        temp.textAlignment = .center
        
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        addTapGesture()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    func addComponents() {
        addSubview(shadowView)
        shadowView.addSubview(containerView)
        containerView.addSubview(title)
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            
            title.topAnchor.constraint(equalTo: containerView.topAnchor),
            title.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        title.text = data.title
        
        switch data.type {
        case .filled(let theme):
            containerView.backgroundColor = theme.value
            title.textColor = .white
        case .outlined(let theme):
            containerView.layer.borderColor = theme.value.cgColor
            containerView.layer.borderWidth = 1
            title.textColor = theme.value
        }
    }
}

extension ActionButtonView: UIGestureRecognizerDelegate {
    @objc fileprivate func actionButtonTapped(_ sender: UITapGestureRecognizer){
        guard let data = returnData() else { return }
        startPressedAnimationCommon(withDuration: 0.3) { [weak self] finish in
            data.actionListener?()
        }
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: .actionButtonTapped)
        tap.delegate = self
        self.addGestureRecognizer(tap)
    }
}

fileprivate extension Selector {
    static let actionButtonTapped = #selector(ActionButtonView.actionButtonTapped)
}
