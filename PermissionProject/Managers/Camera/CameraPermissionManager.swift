//
//  CameraPermissionManager.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import Foundation
import AVFoundation

class CameraPermissionManager: CameraPermissionProtocol {
    func checkPermission() -> Bool {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return true
        default:
            return false
        }
    }
    
    func requestPermission(completion: @escaping VoidCompletionBlock) {
        print("\(#function) : CameraPermissionManager")
        AVCaptureDevice.requestAccess(for: .video) { granted in
            print("Camera permission granted: \(granted)")
        }
    }
    
    func getPermissionRequestViewData(with positiveCompletion: @escaping VoidCompletionBlock,
                                      with negativeCompletion: @escaping VoidCompletionBlock
    ) -> PermissionRequestViewData {
        
        return PermissionRequestViewData(actionButtonModuleData: ActionButtonModuleData(
                                            positiveBtnData: ActionButtonViewData(title: "Grant", type: .filled )
                                                .setActionListener(listener: positiveCompletion),
                                            negativeBtnData: ActionButtonViewData(title: "Not now", type: .outlined)
                                                .setActionListener(listener: negativeCompletion)),
                                        infoViewData: InfoViewData(header: "Camera Permission", body: "Please grant permission to us to use the camera."),
                                        image: PermissionImages.camera.value)
    }
}