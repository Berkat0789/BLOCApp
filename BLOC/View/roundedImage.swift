//
//  roundedImage.swift
//  BLOC
//
//  Created by berkat bhatti on 1/8/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
@IBDesignable

class roundedImage: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateView()
    }
    
    func updateView() {
        self.layer.cornerRadius = self.frame.width / 2
    }

}
