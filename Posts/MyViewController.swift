//
//  MyViewController.swift
//  Posts
//
//  Created by Tobias Gozzi on 03.07.16.
//  Copyright © 2016 Tobias Gozzi. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var tilteTextfield: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func makePost(sender: AnyObject) {
        if let postTitle = tilteTextfield.text, postText = descTextField.text {
            let post = Posts(paramTitle: postTitle, paramDesc: postText)
            
            
        }
    }

  

}
