//
//  signUpVC.swift
//  BLOC
//
//  Created by berkat bhatti on 1/8/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class signUpVC: UIViewController {
//--Outlets
    @IBOutlet weak var usernameField: authTextField!
    @IBOutlet weak var emailField: authTextField!
    @IBOutlet weak var passwordField: authTextField!
    @IBOutlet weak var signUpButton: UIButton!
//--Variables and Arrryas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapToDismissKeyboard()

    }//--end view did load
//--Actions
    @IBAction func signupPressed(_ sender: Any) {
        guard let email = emailField.text, emailField.text != "" else {return}
        guard let password = passwordField.text, passwordField.text != "" else {return}
        
        AuthService.instance.RegisterUser(email: email, password: password) { (success, error) in
            if success {
                AuthService.instance.LoginUser(email: email, Password: password, loginCompleted: { (success, error) in
                    if success {
                        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                        self.present(homeVC!, animated: true, completion: nil)
                    }
                })
            }
        }

    }
    @IBAction func AlreadyHaveaccountPressed(_ sender: Any) {
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
