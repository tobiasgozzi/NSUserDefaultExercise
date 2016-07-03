//
//  Post.swift
//  Posts
//
//  Created by Tobias Gozzi on 03.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import Foundation


class Posts: NSObject, NSCoding {
    
    private var _title: String!
    private var _desc: String!
    
    var title: String {
        return _title
    }
    
    var desc: String {
        return _desc
    }
    
    init(paramTitle: String, paramDesc: String) {
        _desc = paramDesc;
        _title = paramTitle
    }
    
    override init() {

    }
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        _title = aDecoder.decodeObjectForKey("title") as? String
        _desc = aDecoder.decodeObjectForKey("desc") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_title, forKey: "title")
        aCoder.encodeObject(_desc, forKey: "desc")
    }
    
}