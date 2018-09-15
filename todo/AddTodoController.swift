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
        
        // set values
        setValues()
        Stylist.applyStyle(for: descriptionTextView)
    }
    
    @IBAction func addNewItem(_ sender: Any) {
        if descriptionTextView.text != "Description" && itemTitle.text != "" {
            validationMsg.isHidden = true
            applyAddItem()
        } else {
            validationMsg.isHidden = false
        }
    }
    
    @IBAction func uploadImages(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func setValues() {
        validationMsg.isHidden = true
        upload.isHidden = false
    }
    
    // MARK: - TextFieldDelegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard descriptionTextView.textColor == UIColor.lightGray else { return }
        
        textView.text = nil
        textView.textColor = UIColor.black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard descriptionTextView.text.isEmpty else { return }
        
        textView.text = "Description"
        textView.textColor = UIColor.lightGray
    }

    func applyAddItem() {
        let title: String = itemTitle.text ?? ""
        let todoItemInstance = TodoItem(title: title, description: descriptionTextView.text, image: photo.image!)
        
        store.add(todo: todoItemInstance)
        navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        upload.isHidden = true
        photo.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photo.backgroundColor = UIColor.clear
        
        self.dismiss(animated: true, completion: nil)
    }
}
