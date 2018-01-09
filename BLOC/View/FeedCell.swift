//
//  FeedCell.swift
//  BLOC
//
//  Created by berkat bhatti on 1/8/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var userProfileimg: roundedImage!
    @IBOutlet weak var userCareerTitle: UILabel!
    @IBOutlet weak var userNAme: UILabel!
    @IBOutlet weak var datePosted: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postBody: UILabel!
    
    func updateCell(userProfileImage: UIImage, usercareer: String, userName: String, dateposted: String, postImage: UIImage, posttitle: String, postbody: String) {
        userProfileimg.image = userProfileImage
        userCareerTitle.text = usercareer
        userNAme.text = userName
        datePosted.text = dateposted
        postImg.image = postImage
        postTitle.text = posttitle
        postBody.text = postbody
    }
}
