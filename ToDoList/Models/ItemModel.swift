//
//  ItemModel.swift
//  ToDoList
//
//  Created by Oleg Savelyev on 17.04.2022.
//

import Foundation

struct ItemModel: Identifiable {
    
    let id:String = UUID().uuidString
    let title:String
    let isCompleted:Bool
    
}
