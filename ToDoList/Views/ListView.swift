//
//  ListView.swift
//  ToDoList
//
//  Created by Oleg Savelyev on 17.04.2022.
//

import SwiftUI

struct ListView: View {
    
    @State var array:[String] = [
        "This is the first title",
        "This is the second title",
        "This is the third title"
    ]
    var body: some View {
        List {
            ForEach(array, id: \.self){ item in
                ListRowView(title: item)
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: Text("Destination"))
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


