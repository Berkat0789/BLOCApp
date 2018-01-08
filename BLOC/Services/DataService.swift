//
//  DataService.swift
//  BLOC
//
//  Created by berkat bhatti on 1/8/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation
import Firebase

let FirebaseReference = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private(set) public var firebaseRef = FirebaseReference
    private(set) public var firebaseRef_Users = FirebaseReference.child("user")
    private(set) public var firebaseRef_Stories = FirebaseReference.child("stories")
    private(set) public var firebaseRef_Mesages = FirebaseReference.child("mesage")

    
    
//--Add user to Database
    
    func AddusertoDatabase(uid: String, userData: Dictionary<String, Any>) {
        firebaseRef_Users.child(uid).updateChildValues(userData)
    }
    
}
