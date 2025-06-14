//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Sneha Debnath on 14/10/24.
//

import Foundation

/*
 CRUD Functions:
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemForKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemForKey)
        else { return }
        
        guard let savedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedData
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func addItem(title: String, description: String) {
        let newItem = ItemModel(title: title, description: description, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(thing: ItemModel) {
        
        if let index = items.firstIndex(where: { $0.id == thing.id }) {
            items[index] = thing.updateCompletion()
        }
    }
    
    func saveItems() {
        /*
         we will convert ItemModel into JSON DATA, it is just a data blob and then we are going to put that in USER DEFAULTS
         and then when we retrieve it, we're just going to convert it back from the data to ItemModel
        */
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemForKey)
        }
    }
}
