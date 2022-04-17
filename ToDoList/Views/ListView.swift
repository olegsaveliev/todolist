//
//  ListView.swift
//  ToDoList
//
//  Created by Oleg Savelyev on 17.04.2022.
//

import SwiftUI

struct ListView: View {
    
    @State var array:[ItemModel] = [
    ItemModel(title: "this is the first title", isCompleted: false),
    ItemModel(title: "this is the second title", isCompleted: true),
    ItemModel(title: "this is the third title", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(array){ item in
                ListRowView(item: item)
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        ListView()
        }
    }
}


