//
//  EditItemContoller.swift
//  todo
//
//  Created by Heba Atallah on 9/7/18.
//  Copyright © 2018 Heba Atallah. All rights reserved.
//

import UIKit

class EditItemContoller: UIViewController {
    var titleValuePassed: String = ""
    var descriptionValuePassed: String = ""
    var indexValuePassed: Int = 0
    var imageValuePassed: UIImage = UIImage(named: "Banana")!
//    var todo: TodoItem!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var updateValidationMessage: UILabel!
    @IBOutlet weak var editedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateValidationMessage.isHidden = true
        titleTextField.text = titleValuePassed
        descriptionTextField.text = descriptionValuePassed
        editedImage.image = imageValuePassed
        Stylist.applyStyle(for: descriptionTextField)
    }
    
    @IBAction func updateAction(_ sender: Any) {
        if descriptionTextField.text.isEmpty == false && titleTextField.text != "" {
            updateValidationMessage.isHidden = true
            applyUpdateItem()
        } else {
            updateValidationMessage.isHidden = false
        }
    }
    
    func applyUpdateItem() {
        // Nil coalasing operator `??`
        let title = titleTextField.text ?? ""
        let todoItemInstance = TodoItem(itemTitle: title, descriptionText: descriptionTextField.text, image: UIImage(named: "Apple")!)
        store.todos[indexValuePassed] = todoItemInstance
        navigationController?.popViewController(animated: true)
    }
}
