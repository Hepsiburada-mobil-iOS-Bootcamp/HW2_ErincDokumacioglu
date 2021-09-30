//
//  MainViewController.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {
    private lazy var stackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [cameraOpenActionButton, photosOpenActionButton])
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        
        return temp
    }()
    
    private lazy var cameraOpenActionButton: ActionButtonView = {
        let temp = ActionButtonView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.widthAnchor.constraint(equalToConstant: 150).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return temp
    }()
    
    private lazy var photosOpenActionButton: ActionButtonView = {
        let temp = ActionButtonView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.widthAnchor.constraint(equalToConstant: 150).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return temp
    }()
    
    override func prepareViewControllerSetup() {
        super.prepareViewControllerSetup()
        
        addMainStackView()
        setupData()
    }
    
    private func addMainStackView() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupData() {
        cameraOpenActionButton.setData(data: viewModel.getCameraActionButtonData().setActionListener(listener: cameraActionListener))
        photosOpenActionButton.setData(data: viewModel.getPhotoPermissionButtonData().setActionListener(listener: photoActionListener))
    }
    
    private lazy var cameraActionListener: VoidCompletionBlock = { [weak self] in
        guard let self = self else { return }
        self.viewModel.openCamera { granted in
            granted ? (print("Camera granted to open")) : self.firePermissionRequestView(with: .camera)
        }
    }
    
    private lazy var photoActionListener: VoidCompletionBlock = { [weak self] in
        guard let self = self else { return }
        self.viewModel.openPhotos{ granted in
            granted ? (print("Photos granted to open")) : self.firePermissionRequestView(with: .photo)
        }
    }
    

    private func firePermissionRequestView(with type: PermissionType) {
        present(PermissionViewBuilder.build(with: type), animated: true) {
            print("\(type) Permission view has just presented.")
        }
    }
    
}
