//
//  AddTodoController.swift
//  todo
//
//  Created by Heba Atallah on 8/25/18.
//  Copyright © 2018 Heba Atallah. All rights reserved.
//

import UIKit

class AddTodoController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var validationMsg: UILabel!
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationMsg.isHidden = true
        applyStyle(for: descriptionTextView)
    }
    
    // MARK: - TextFieldDelegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.textColor == UIColor.lightGray {
            descriptionTextView.text = nil
            descriptionTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionTextView.text.isEmpty {
            descriptionTextView.text = "Description"
            descriptionTextView.textColor = UIColor.lightGray
        }
    }
    
    func applyStyle(for textView: UITextView) {
        guard textView == descriptionTextView else { return }
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.borderColor = borderColor.cgColor
        descriptionTextView.layer.cornerRadius = 5.0
        descriptionTextView.text = "Description"
        descriptionTextView.textColor = UIColor.lightGray
    }

    @IBAction func addNewItem(_ sender: Any) {
        if descriptionTextView.text != "Description" && itemTitle.text != "" {
            validationMsg.isHidden = true
            applyAddItem()
        } else {
            validationMsg.isHidden = false
        }
    }

    func applyAddItem() {
        
//        let title: String
//        // Optional binding
//        if let itemTitle = itemTitle.text {
//            title = itemTitle
//        } else {
//            title = ""
//        }
        
        // Nil coalasing operator `??`
        let title: String = itemTitle.text ?? ""
        let todoItemInstance = TodoItem(itemTitle: title, descriptionText: descriptionTextView.text)
        store.todos.append(todoItemInstance)
        navigationController?.popViewController(animated: true)
    }
}
