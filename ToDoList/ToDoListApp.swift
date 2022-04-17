//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Oleg Savelyev on 17.04.2022.
//

import SwiftUI

@main
struct ToDoListApp: App {
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
            ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
