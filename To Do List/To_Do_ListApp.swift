//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Olha Hladush on 12/17/22.
//

import SwiftUI

@main
struct To_Do_ListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
