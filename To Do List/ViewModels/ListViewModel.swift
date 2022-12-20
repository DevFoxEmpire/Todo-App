//
//  ListViewModel.swift
//  To Do List
//
//  Created by Olha Hladush on 12/18/22.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 CREATE
 READ
 UPDATE
 DELETE
 
 */

class ListViewModel: ObservableObject {
    @Published var items:[ItemModel] = [] {
        didSet { 
            saveItems()
        }
    }
    
    let itemsKey:String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
        
//        let newItems = [
//            ItemModel(title: "This is the first title", isCompleted: false),
//            ItemModel(title: "This is the second title", isCompleted: true),
//            ItemModel(title: "This is the thirs title", isCompleted: false),
//        ]
//        items.append(contentsOf: newItems)
    }
    func deleteItem(indexSet:IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem( from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        
//        if let index = items.firstIndex { (existindItem) -> Bool in
//            return existindItem.id == item.id
//        } {
//            //run this
//
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            //run this
            items[index] = item.updateCompletion()
        }
    }
    func saveItems() {
        if let encodedData = try?  JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}

