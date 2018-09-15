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

        // set navigation item
        setNavigationItem()
        tableview.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.todos.count
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = store.todos[sourceIndexPath.row]
        
        store.delete(index: sourceIndexPath.row)
        store.insert(todo: movedObject, index: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        let todoItem = store.todos[indexPath.row]
        todoCell.textLabel?.text = todoItem.title
        todoCell.detailTextLabel?.text = todoItem.description
        todoCell.imageView?.image = todoItem.image

        return todoCell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            store.delete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Edit Segue" else { return }
        
        let indexPath = tableView.indexPathForSelectedRow
        let todoItem = store.todos[indexPath!.row]
        let editItemContoller = segue.destination as! EditItemContoller
        
        editItemContoller.selectedItem = TodoItem(title: todoItem.title, description: todoItem.description, image: (todoItem.image))
        editItemContoller.indexValuePassed = (indexPath?.row)!
    }
    
    func setNavigationItem() {
        navigationItem.title = "Todo List"
        navigationItem.leftBarButtonItem = self.editButtonItem
    }
}
