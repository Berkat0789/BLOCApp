//
//  authTextField.swift
//  BLOC
//
//  Created by berkat bhatti on 1/8/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

@IBDesignable
class authTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateView()
    }
 
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
        
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
        
    }
    
    func updateView() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.1725490196, green: 0.2431372549, blue: 0.262745098, alpha: 1)])
        self.attributedPlaceholder = placeholder
        self.layer.cornerRadius = self.frame.width / 10.5
        self.clipsToBounds = true
        
    }
    
    
    
    
}
