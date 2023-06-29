//
//  ToDoItem.swift
//  to do list app
//
//  Created by Scholar on 6/27/23.
//

import Foundation

class ToDoItem: Identifiable {
    var ID = UUID()
    var title = ""
    var isImportant = false
    
    init(title : String, isImportant: Bool = false){
        self.title = title
        self.isImportant = isImportant
    }
}
