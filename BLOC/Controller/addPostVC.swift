//
//  addPostVC.swift
//  BLOC
//
//  Created by berkat bhatti on 1/9/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase

class addPostVC: UIViewController {

    @IBOutlet weak var descriptionLBL: UITextView!
    @IBOutlet weak var titlelbl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addtapToDismissKeyboaed()

    }//--end view did load
    @IBAction func postPressed(_ sender: Any) {
        guard let title = titlelbl.text, titlelbl.text != "" else {return}
        guard let description = descriptionLBL.text, descriptionLBL.text != "" || descriptionLBL.text != "add  details here...." else {return}
        
        DataService.instance.addPostToDatabase(Title: title, description: description, image: "\(String(describing: UIImage(named:"library")))", senderID: (Auth.auth().currentUser?.uid)!) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//--Gestures and Animations
    
    func addtapToDismissKeyboaed() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(addTap(_:)))
        self.view.addGestureRecognizer(tap)
    }
//--Selectors
    @objc func addTap(_ recon: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
   

}
