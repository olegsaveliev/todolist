//
//  ItemModel.swift
//  ToDoList
//
//  Created by Oleg Savelyev on 17.04.2022.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    
    let id:String
    let title:String
    let isCompleted:Bool
    
    init(id:String = UUID().uuidString, title:String, isCompleted:Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    func updateCompeltion()->ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
