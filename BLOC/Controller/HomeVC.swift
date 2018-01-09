//
//  HomeVC.swift
//  BLOC
//
//  Created by berkat bhatti on 1/8/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

//--Outlets
    @IBOutlet weak var tableView: UITableView!
    
//--Variable and Arrays
    var PostList = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }//end view did load
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataService.instance.getAllPosts { (PostList) in
            self.PostList = PostList.reversed()
            self.tableView.reloadData()
        }
    }
  
    @IBAction func addbuttonPressed(_ sender: Any) {
        let addPostvc = storyboard?.instantiateViewController(withIdentifier: "addPostVC")
        present(addPostvc!, animated: true, completion: nil)
    }
    //--Protocol Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? FeedCell else {return UITableViewCell()}
        let post = PostList[indexPath.row]
        cell.updateCell(userProfileImage: UIImage(named: "me")!, usercareer: "writer", userName: "berkat", dateposted: "3 days ago", postImage: UIImage(named: "workstation")!, posttitle: post.postTitle, postbody: post.postDescription)
        return cell
    }
    
//Actions


}
