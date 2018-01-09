//
//  ProfileVC.swift
//  BLOC
//
//  Created by berkat bhatti on 1/9/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }//-- end view did load
    
    
//--Actions
  
    
    @IBAction func logoutPressed(_ sender: Any) {
        
        let logoutView = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .alert)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (logoutPressed) in
            do {
                try Auth.auth().signOut()
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
                self.present(loginVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutView.addAction(logoutAction)
        present(logoutView, animated: true, completion: nil)
       
    }
    

}
