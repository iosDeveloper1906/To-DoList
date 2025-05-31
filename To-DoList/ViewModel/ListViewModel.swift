//
//  ListViewModel.swift
//  To-DoList
//
//  Created by Vaibhav Gawde on 31/05/25.
//

import Foundation


class ListViewModel : ObservableObject{
    
    @Published var items: [ItemModel] = [] {
        
        didSet {
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    
    func getItems()  {
        
        guard let data  = UserDefaults.standard.data(forKey: "items") else { return }
        let newItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        
        self.items = newItems ?? []
    }
    
    
    func deleteItems(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
    func addItem(title: String){
        items.append(ItemModel(titile: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateModel()
        }
    }
    
    func saveItems() {
        
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "items")
        }
    }
}
