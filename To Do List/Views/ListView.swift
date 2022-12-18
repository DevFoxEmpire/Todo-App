//
//  ListView.swift
//  To Do List
//
//  Created by Olha Hladush on 12/18/22.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title", isCompleted: false),
        ItemModel(title: "This is the second title", isCompleted: true),
        ItemModel(title: "This is the thirs title", isCompleted: false),
    ]
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
                
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo list 💌")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

