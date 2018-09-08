//
//  Stylist.swift
//  todo
//
//  Created by Heba Atallah on 9/8/18.
//  Copyright © 2018 Heba Atallah. All rights reserved.
//

import UIKit

class Stylist {
    
    class func applyStyle(for textView: UITextView) {
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = borderColor.cgColor
        textView.layer.cornerRadius = 5.0
    }
    
}
