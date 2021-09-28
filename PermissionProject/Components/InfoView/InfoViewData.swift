//
//  InfoViewData.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 28.09.2021.
//

import Foundation

class InfoViewData {
    private(set) var header: String
    private(set) var body: String
    
    init(header: String, body: String) {
        self.body = body
        self.header = header
    }
}
