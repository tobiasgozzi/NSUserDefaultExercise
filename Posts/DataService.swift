//
//  DataService.swift
//  Posts
//
//  Created by Tobias Gozzi on 04/07/16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import Foundation

class DataService {
    static let instance: DataService = DataService()
    
    private var _loadedPosts = [Posts]()
    
    let KEY_POSTS = "posts"
    
    var loadedPosts: [Posts] {
        return _loadedPosts
    }
    
    func savePosts(){
        let postData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postData, forKey: KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        if let postData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
            if let postArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) as? [Posts] {
                _loadedPosts = postArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
        
    }
    
    func addPosts(post: Posts) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
}
