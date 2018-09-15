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

    private(set) var todos = [
        TodoItem(title: "test1", description: "Lorem Ipsum", image: UIImage(named: "Apple")!),
        TodoItem(title: "test2", description: "Aenean condimentum", image: UIImage(named: "Apricot")!),
        TodoItem(title: "test3", description: "Aenean condimentumdd" , image: UIImage(named: "Banana")!),
        TodoItem(title: "test4", description: "Aenean condimentumada", image: UIImage(named: "Blueberry")!)
        ]
    
    func add(todo: TodoItem) {
        todos.append(todo)
    }
    
    func update(todo: TodoItem, index: Int) {
         todos[index] = todo
    }
    
    func delete(index: Int) {
        todos.remove(at: index)
    }
    
    func insert(todo: TodoItem, index: Int) {
         todos.insert(todo, at: index)
    }
}
