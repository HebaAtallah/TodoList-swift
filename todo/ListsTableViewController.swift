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
        tableview.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    @objc public func showAddUserAlertController() {
        let alertCtrl = UIAlertController(title: "Add User", message: "Add a user to the list", preferredStyle: .alert)
        present(alertCtrl, animated: true, completion: nil)
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
