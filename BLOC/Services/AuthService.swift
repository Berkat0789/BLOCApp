//
//  AuthService.swift
//  BLOC
//
//  Created by berkat bhatti on 1/8/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func RegisterUser(email: String, password: String, registerCompleted: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                registerCompleted(false, error)
                return
            }
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.AddusertoDatabase(uid: user.uid, userData: userData)
            registerCompleted(true, nil)
        }
        
    }
    func LoginUser(email: String, Password: String, loginCompleted: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: Password) { (user, error) in
            guard let user = user else {
                loginCompleted(false, error)
                return
            }
            loginCompleted(true, nil)
        }
    }
}
