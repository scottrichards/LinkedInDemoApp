//
//  ViewController.swift
//  LinkedInDemoApp
//
//  Created by Scott Richards on 7/15/16.
//  Copyright © 2016 BitWyze. All rights reserved.
//

import UIKit



class LoginViewController: UIViewController {
    var linkedInConnect : LinkedInOAuthConnect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        linkedInConnect = LinkedInOAuthConnect()
   //     self.performSegueWithIdentifier("segueToTab", sender: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(LoginViewController.loginSuccess),
                                                         name: Constants.Notification.LogIn,
                                                         object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSignIn(sender: AnyObject) {
        linkedInConnect?.login()

    }
    
    func loginSuccess() {
        self.performSegueWithIdentifier("segueToTab", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("segue: \(segue.identifier)")
    }

}

