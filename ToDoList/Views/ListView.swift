//
//  ListView.swift
//  ToDoList
//
//  Created by Oleg Savelyev on 17.04.2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var model:ListViewModel
    
    var body: some View {
        ZStack{
            if model.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(model.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    model.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete (perform: model.deleteItem)
                    .onMove(perform: model.moveIteam)
                    
                }
                .listStyle(PlainListStyle())
            }
        }
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
            ListView().environmentObject(ListViewModel())
        }
    }
}


