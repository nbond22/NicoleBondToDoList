//
//  toDoItem.swift
//  NicoleBondToDoList
//
//  Created by Scholar on 4/28/25.
//

import Foundation
import SwiftData

@Model
class toDoItem {
    var title: String
    var isImportant: Bool
    
    init(title: String, isImportant: Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
}

