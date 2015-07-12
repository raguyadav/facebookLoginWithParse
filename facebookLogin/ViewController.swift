//
//  ViewController.swift
//  facebookLogin
//
//  Created by sushi on 2015-06-27.
//  Copyright (c) 2015 Entremetteurs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    
    @IBAction func signIn(sender: AnyObject) {
        
        var permissions = ["public_profile", "email", "user_friends"]
        
        
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions) {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    println("User signed up and logged in through Facebook!")
                    
                    self.performSegueWithIdentifier("signUp", sender: self)
                    
                    
                } else {
                    println("User logged in through Facebook!")
                }
            } else {
                println("Uh oh. The user cancelled the Facebook login.")
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (PFUser.currentUser() != nil) {
            println("User Logged in")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

