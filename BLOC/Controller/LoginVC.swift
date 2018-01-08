//
//  LoginVC.swift
//  BLOC
//
//  Created by berkat bhatti on 1/7/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
//--Outlets
    @IBOutlet weak var usernameField: authTextField!
    @IBOutlet weak var passwordField: authTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapToDismissKeyboard()
        
    }//=-end view did load
    
//--Actions
    @IBAction func LoginPressed(_ sender: Any) {
    }
    @IBAction func DontHaveaccountPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
//-ProtocolFunctions
    
    //--Gestures and Animations
    func tapToDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapTodismissKeyboard(_:)))
        self.view.addGestureRecognizer(tap)
    }
    //--Selectors
    @objc func tapTodismissKeyboard(_ Recon: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    //--View update functions



}//end controller 
