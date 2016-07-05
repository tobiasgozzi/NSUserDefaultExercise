//
//  ViewController.swift
//  Posts
//
//  Created by Tobias Gozzi on 03.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableTitle: UILabel!
    @IBOutlet weak var tablePost: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: "postsLoaded", object: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let postToInit = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostsCell {
            cell.configureCell(postToInit)
            return cell
            
        } else {
            let cell = PostsCell()
            cell.configureCell(postToInit)
            return cell
        }

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func onPostsLoaded(notify: AnyObject) {
        tableView.reloadData()
    }

}

