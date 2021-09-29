//
//  PermissionManagerProtocol.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 29.09.2021.
//

import Foundation
import Combine

protocol PermissionManagerProtocol {
    func requestPermission(completion: @escaping VoidCompletionBlock)
    
    func getPermissionRequestViewData(with positiveCompletion: @escaping VoidCompletionBlock,
                                      with negativeCompletion: @escaping VoidCompletionBlock
    ) -> PermissionRequestViewData
}
