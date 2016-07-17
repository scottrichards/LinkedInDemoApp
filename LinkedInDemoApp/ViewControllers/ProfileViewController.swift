//
//  ProfileViewController.swift
//  LinkedInDemoApp
//
//  Created by Scott Richards on 7/16/16.
//  Copyright © 2016 BitWyze. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var linkedInBridge : LinkedInBridge?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        linkedInBridge = LinkedInBridge()
        linkedInBridge?.apiRequestWithEndPoint("https://www.linkedin.com/v1/people/~", onSuccess: { (result: String!) -> Void in
                print("success: \(result)")
            }, onError: { (error: String!) -> Void in
                print("ERROR: \(error)")
            }
        );
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
