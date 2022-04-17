//
//  AddView.swift
//  ToDoList
//
//  Created by Oleg Savelyev on 17.04.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var model: ListViewModel
    @State var textFieldText:String = ""
    @State var alerTitle = ""
    @State var showALert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.0, brightness: 0.891)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                
                Button {
                    savedButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }
            .padding(14)
        }
        .navigationTitle("Add an item  🖊")
        .alert(isPresented: $showALert, content: getAlert)
    }
    func savedButtonPressed() {
        if textIsAppropriate() {
        model.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alerTitle = "Your new ToDo item must be at least 3 charactes long!!! 🧐"
            showALert.toggle()
            return false
        }
        return true
        }
        
        func getAlert()->Alert {
            return Alert(title: Text(alerTitle))
        }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView().environmentObject(ListViewModel())
        }
    }
}
