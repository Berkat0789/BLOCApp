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
    @IBOutlet weak var EmailField: authTextField!
    @IBOutlet weak var passwordField: authTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapToDismissKeyboard()
        
    }//=-end view did load
    
//--Actions
    @IBAction func LoginPressed(_ sender: Any) {
        guard let email = EmailField.text, EmailField.text != "" else {return}
        guard let password = passwordField.text, passwordField.text != "" else {return}
        
        DataService.instance.findUserbyEmail(Email: email) { (success) in
            if success {
                AuthService.instance.LoginUser(email: email, Password: password, loginCompleted: { (success, error) in
                    if success {
                       let homevc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                        self.present(homevc!, animated: true, completion: nil)
                    }
                })
            }
        }
    }
    @IBAction func DontHaveaccountPressed(_ sender: Any) {
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "signUpVC")
        present(signUpVC!, animated: true, completion: nil)
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
