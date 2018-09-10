//
//  Store.swift
//  todo
//
//  Created by Heba Atallah on 9/1/18.
//  Copyright © 2018 Heba Atallah. All rights reserved.
//

import UIKit

let store = Store()

class Store {
    
//    static let shared = Store()
//
//    private(set) var todos = [
//        TodoItem(itemTitle: "test1", descriptionText: "Lorem Ipsum"),
//        TodoItem(itemTitle: "test2", descriptionText: "Aenean condimentum"),
//        TodoItem(itemTitle: "test3", descriptionText: "Aenean condimentumdd"),
//        TodoItem(itemTitle: "test4", descriptionText: "Aenean condimentumada"),
//        ]
    var todos = [
        TodoItem(itemTitle: "test1", descriptionText: "Lorem Ipsum", image: UIImage(named: "Apple")!),
        TodoItem(itemTitle: "test2", descriptionText: "Aenean condimentum", image: UIImage(named: "Apricot")!),
        TodoItem(itemTitle: "test3", descriptionText: "Aenean condimentumdd", image: UIImage(named: "Banana")!),
        TodoItem(itemTitle: "test4", descriptionText: "Aenean condimentumada", image: UIImage(named: "Cantaloupe")!),
        ]
    
    func add(todo: TodoItem) {
        // validation
        todos.append(todo)
    }
    
    func update(todo: TodoItem) {
        
    }
    
    func delete(todo: TodoItem) {
        
    }
}

//Store().todos
//let x = TodoItem(itemTitle: "", descriptionText: "")
//store.todos.append(x)
