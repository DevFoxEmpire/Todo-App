//
//  ItemModel.swift
//  To Do List
//
//  Created by Olha Hladush on 12/18/22.
//

import Foundation

struct ItemModel:Identifiable {
    
    let id:String = UUID().uuidString
    let title:String
    let isCompleted:Bool
    
}
