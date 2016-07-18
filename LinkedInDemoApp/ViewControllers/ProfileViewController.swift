//
//  ProfileViewController.swift
//  LinkedInDemoApp
//
//  Created by Scott Richards on 7/16/16.
//  Copyright © 2016 BitWyze. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class ProfileViewController: UIViewController {
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    var linkedInBridge : LinkedInBridge?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        linkedInBridge = LinkedInBridge()
        linkedInBridge?.apiRequestWithEndPoint("https://www.linkedin.com/v1/people/~", onSuccess: { (result: String!) -> Void in
                if let dataFromString = result.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                    // Do it using ObjectMapper,  https://github.com/Hearst-DD/ObjectMapper/
                    let profile = Mapper<Profile>().map(result)
                    // approach using SwiftyJSON
                    let json = JSON(data: dataFromString)
                    self.updateView(json)
                    
                    
                }
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
    
    
    func updateView(json : JSON) {
        nameLabel.text = json["firstName"].string
        titleLabel.text = json["headline"].string
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
