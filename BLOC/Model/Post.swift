//
//  Post.swift
//  BLOC
//
//  Created by berkat bhatti on 1/9/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation
import UIKit

class Post {
    private(set) public var postTitle: String!
    private(set) public var postDescription: String!
    private(set) public var postImage: String!
    private(set) public var senderID: String!

    init(Title: String, Description: String, Image: String, senderID: String) {
        self.postTitle = Title
        self.postDescription = Description
        self.postImage = Image
        self.senderID = senderID
    }
}//--end class
