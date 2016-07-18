//
//  LinkedInOAuthConnect.swift
//  LinkedInDemoApp
//
//  Created by Scott Richards on 7/17/16.
//  Copyright © 2016 BitWyze. All rights reserved.
//

import UIKit
import OAuthSwift

class LinkedInOAuthConnect: NSObject {
    let linkedInState : String = "DCEeFWf45A53sdrVS669"
    
    func login() {
        // 1 Create OAuth2Swift object
        let oauthswift = OAuth2Swift(
            consumerKey:    "75218eo6kuu51f",         // 2 Enter google app settings
            consumerSecret: "jqObiufQEOUpPcYW",
            authorizeUrl:   "https://www.linkedin.com/oauth/v2/authorization",
            accessTokenUrl: "https://accounts.google.com/o/oauth2/token",
            responseType:   "code"
        )
        oauthswift.authorize_url_handler = WebViewController()
        // 3 Trigger OAuth2 dance
        oauthswift.authorizeWithCallbackURL(
            NSURL(string: "http://BitWyze.LinkedInDemoApp")!,
            //           NSURL(string: "http://BitWyze.LinkedInDemoApp/auth/linkedin")!,
            scope: "r_basicprofile",        // 4 Scope
            state: "linkedin",
            success: { credential, response, parameters in
                print(credential.oauth_token)
                print(credential.oauth_token_secret)
                print(parameters["user_id"])
            },
            failure: { error in
                print(error.localizedDescription)
        })
    }
}
