//
//  ItemModel.swift
//  To-DoList
//
//  Created by Vaibhav Gawde on 31/05/25.
//

import Foundation

struct ItemModel : Identifiable, Codable{
    
    let id : String
    let titile: String
    let isCompleted: Bool
    
    
    init(id: String = UUID().uuidString, titile: String, isCompleted: Bool) {
        self.id = id
        self.titile = titile
        self.isCompleted = isCompleted
    }
    
    func updateModel() -> ItemModel{
        return ItemModel(id: id, titile: titile, isCompleted: !isCompleted)
    }
    
}
