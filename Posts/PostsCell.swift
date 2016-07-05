//
//  myTableViewCell.swift
//  Posts
//
//  Created by Tobias Gozzi on 04.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit

class PostsCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellPost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func configureCell(post: Posts) {
        cellTitle.text = post.title
        cellPost.text = post.desc
    }

}
