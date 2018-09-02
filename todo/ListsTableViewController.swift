//
//  ListsTableViewController.swift
//  todo
//
//  Created by Heba Atallah on 8/29/18.
//  Copyright © 2018 Heba Atallah. All rights reserved.
//

import UIKit

class ListsTableViewController: UITableViewController {
    // MARK: - Table view data source

    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Todo List"
        navigationItem.leftBarButtonItem = self.editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAddUserAlertController))
        tableview.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    @objc public func showAddUserAlertController() {
        let alert = UIAlertController(title: "Enter your todo item", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input title here..."}
        )
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input description here..."}
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            let name = alert.textFields?[0].text
            let des = alert.textFields?[1].text
            let todoItemInstance = TodoItem(itemTitle: name!, descriptionText: des!)
            store.todos.append(todoItemInstance)
            self.tableView.reloadData()
        }))
        
        self.present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.todos.count
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = store.todos[sourceIndexPath.row]
        store.todos.remove(at: sourceIndexPath.row)
        store.todos.insert(movedObject, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        let todoItem = store.todos[indexPath.row]
        todoCell.textLabel?.text = todoItem.itemTitle
        todoCell.detailTextLabel?.text = todoItem.descriptionText
        return todoCell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            store.todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}
