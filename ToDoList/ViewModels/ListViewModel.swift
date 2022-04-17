//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Oleg Savelyev on 17.04.2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items:[ItemModel] = []
    
    init(){
        addItems()
    }
    
    func addItems(){
        let newItems = [
            ItemModel(title: "this is the first title", isCompleted: false),
            ItemModel(title: "this is the second title", isCompleted: true),
            ItemModel(title: "this is the third title", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveIteam(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
        
    }
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompeltion()
        }
        
    }
}
