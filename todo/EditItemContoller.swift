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
    var selectedItem: TodoItem!

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var updateValidationMessage: UILabel!
    @IBOutlet weak var editedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set values
        setValues()
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
    
    func setValues() {
        titleTextField.text = selectedItem.title
        descriptionTextField.text = selectedItem.description
        editedImage.image = selectedItem.image
        updateValidationMessage.isHidden = true
    }
    
    func applyUpdateItem() {
        let title = titleTextField.text ?? ""
        let todoItemInstance = TodoItem(title: title, description: descriptionTextField.text, image: editedImage.image!)
        store.update(todo: todoItemInstance, index: indexValuePassed)
        navigationController?.popViewController(animated: true)
    }
}
