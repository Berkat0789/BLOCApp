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
    private(set) public var firebaseRef_Posts = FirebaseReference.child("post")
    private(set) public var firebaseRef_Mesages = FirebaseReference.child("mesage")

    
    
//--Add user to Database
    
    func AddusertoDatabase(uid: String, userData: Dictionary<String, Any>) {
        firebaseRef_Users.child(uid).updateChildValues(userData)
    }
    
    func findUserbyEmail(Email: String, completed: @escaping (_ status: Bool) -> ()) {
        var userEmails = [String]()
        firebaseRef_Users.observe(.value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else {return}
            
            for user in userSnapshot {
                let email = user.childSnapshot(forPath: "email").value as! String
                userEmails.append(email)
                if userEmails.contains(Email) {
                    completed(true)
                }
            }
        }
    }
    func addPostToDatabase(Title: String, description: String, image: String, senderID: String, completed :@escaping (_ status: Bool) -> ()) {
        firebaseRef_Posts.childByAutoId().updateChildValues(["title": Title, "description" : description, "image": image, "senderid" : senderID])
        completed(true)
    }
    func getAllPosts(complete: @escaping (_ posts: [Post]) -> ()) {
        var postList = [Post]()
        firebaseRef_Posts.observeSingleEvent(of: .value) { (postSnapshot) in
            guard let postSnapshot = postSnapshot.children.allObjects as? [DataSnapshot] else {return}
            
            for post in postSnapshot {
                let description = post.childSnapshot(forPath: "description").value as! String
                let title = post.childSnapshot(forPath: "title").value as! String
                let image = post.childSnapshot(forPath: "image").value as! String
                let senderID = post.childSnapshot(forPath: "senderid").value as! String

                let allPost = Post(Title: title, Description: description, Image: image, senderID: senderID)
                postList.append(allPost)
                complete(postList)
            }
        }
    }//--end get all post
    
    
}//end class
