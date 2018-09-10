//
//  AddTodoController.swift
//  todo
//
//  Created by Heba Atallah on 8/25/18.
//  Copyright © 2018 Heba Atallah. All rights reserved.
//

import UIKit

class AddTodoController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var itemTitle: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var validationMsg: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var upload: UIButton!
    
    // MARK: - Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationMsg.isHidden = true
        upload.isHidden = false
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
        let todoItemInstance = TodoItem(itemTitle: title, descriptionText: descriptionTextView.text, image: photo.image!)
        store.todos.append(todoItemInstance)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func uploadImages(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        upload.isHidden = true
        photo.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photo.backgroundColor = UIColor.clear
        self.dismiss(animated: true, completion: nil)
//        uploadImage()
    }
//
//    func uploadImage () {
//        let imageData = UIImageJPEGRepresentation(photo.image!, 1)
//        guard imageData == nil else {return }
//    }
//
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
}
