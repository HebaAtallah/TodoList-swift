//
//  EditItemContoller.swift
//  todo
//
//  Created by Heba Atallah on 9/7/18.
//  Copyright © 2018 Heba Atallah. All rights reserved.
//

import UIKit

class EditItemContoller: UIViewController {
    var titleValuePassed:String = ""
    var descriptionValuePassed:String = ""
    var indexValuePassed:Int = 0
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var updateValidationMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateValidationMessage.isHidden = true
        titleTextField.text = titleValuePassed
        descriptionTextField.text = descriptionValuePassed
        applyStyle(for: descriptionTextField)
    }
    
    func applyStyle(for textView: UITextView) {
        guard textView == descriptionTextField else { return }
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        descriptionTextField.layer.borderWidth = 0.5
        descriptionTextField.layer.borderColor = borderColor.cgColor
        descriptionTextField.layer.cornerRadius = 5.0
    }
    @IBAction func updateAction(_ sender: Any) {
        if descriptionTextField.text != "" && titleTextField.text != "" {
            updateValidationMessage.isHidden = true
            applyUpdateItem()
        } else {
            updateValidationMessage.isHidden = false
        }
    }
    
    func applyUpdateItem() {
        // Nil coalasing operator `??`
        let title: String = titleTextField.text ?? ""
        let todoItemInstance = TodoItem(itemTitle: title, descriptionText: descriptionTextField.text)
        store.todos[indexValuePassed] = todoItemInstance
        navigationController?.popViewController(animated: true)
    }
}
