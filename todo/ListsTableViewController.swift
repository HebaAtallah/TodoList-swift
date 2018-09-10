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
        tableview.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
//    @objc public func showAddUserAlertController() {
//        let alert = UIAlertController(title: "Enter your todo item", message: nil, preferredStyle: .alert)
        
//        cancel action
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
//        add action
//        let okAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.default, handler: { (action) -> Void in
//            let title: String = alert.textFields?[0].text ?? ""
//            let descriptionTextView = alert.textFields?[1].text
//            let todoItemInstance = TodoItem(itemTitle: title, descriptionText: descriptionTextView!, image: "Apple")
//            store.todos.append(todoItemInstance)
//            self.tableView.reloadData()
//        })
        
//        title text field
//        alert.addTextField(configurationHandler: { textField in
//            textField.placeholder = NSLocalizedString("Input title here...", comment: "")
//            textField.addTarget(self, action: #selector(self.textChanged(_:)), for: UIControlEvents.editingChanged)
//        })
//        descrition text field
//        alert.addTextField(configurationHandler: { textField in
//            textField.placeholder = "Input description here..."
//            textField.addTarget(self, action: #selector(self.textChanged(_:)), for: UIControlEvents.editingChanged)
//        })
//        okAction.isEnabled = false
//        alert.addAction(okAction)
//        
//        self.present(alert, animated: true, completion: nil)
//    }
    
    @objc func textChanged(_ sender:UITextField) {
        let alert = self.presentedViewController as? UIAlertController
        let title = alert?.textFields?[0].text
        let description = alert?.textFields?[1].text
        let okAction = alert!.actions.last! as UIAlertAction
        if title != "" && description != "" {
            okAction.isEnabled = true
        } else {
            okAction.isEnabled = false
        }
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
        todoCell.imageView?.image = todoItem.image

        return todoCell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let todoItem = store.todos[indexPath.row]
//        
//        // create the edit view controller
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let editItemContoller = mainStoryboard.instantiateViewController(withIdentifier: "edit view controller") as! EditItemContoller
//        
//        // configure it
//        editItemContoller.titleValuePassed = todoItem.itemTitle
//        editItemContoller.descriptionValuePassed = todoItem.descriptionText
//        editItemContoller.indexValuePassed = indexPath.row
//        
//        // display it
//        navigationController?.pushViewController(editItemContoller, animated: true)
//    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            store.todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Edit Segue" else { return }
        // Get the index path from the cell that was tapped
        let indexPath = tableView.indexPathForSelectedRow
        // Get the Row of the Index Path and set as index
        print(segue)
        let todoItem = store.todos[indexPath!.row]
        // Get in touch with the DetailViewController
        let editItemContoller = segue.destination as! EditItemContoller
        // Pass on the data to the Detail ViewController by setting it's indexPathRow value
        
//        editItemContoller.todo = todoItem
        
        editItemContoller.titleValuePassed = todoItem.itemTitle
        editItemContoller.descriptionValuePassed = todoItem.descriptionText
        editItemContoller.indexValuePassed = (indexPath?.row)!
        editItemContoller.imageValuePassed = (todoItem.image)
    }

}
