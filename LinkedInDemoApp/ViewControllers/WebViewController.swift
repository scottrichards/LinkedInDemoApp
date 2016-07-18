//
//  WebViewController.swift
//  LinkedInDemoApp
//
//  Created by Scott Richards on 7/17/16.
//  Copyright © 2016 BitWyze. All rights reserved.
//

import UIKit
import OAuthSwift

class WebViewController: OAuthWebViewController, UIWebViewDelegate {
    var targetURL : NSURL?
    var webView : UIWebView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = view.bounds
        webView.autoresizingMask =
            UIViewAutoresizing([.FlexibleHeight, .FlexibleWidth])
        webView.scalesPageToFit = true
        view.addSubview(webView)
        self.webView.delegate = self
        loadAddressURL()
    }
    
    
    
    override func handle(url: NSURL) {
        targetURL = url
        super.handle(url)
        
        loadAddressURL()
    }
    
    func loadAddressURL() {
//        if let targetURL = targetURL {
//            print("targetURL.absoluteString: \(targetURL.absoluteString)")
//            let req = NSURLRequest(URL: targetURL)
//            webView.loadRequest(req)
//        }
        let req = NSURLRequest(URL: targetURL!)
        self.webView.loadRequest(req)

    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.URL!
        print(url)
        
        if url.host == "bitwyze.linkedindemoapp" {
            if url.absoluteString.rangeOfString("code") != nil {
                // Extract the authorization code.
                let urlParts = url.absoluteString.componentsSeparatedByString("?")
                let code = urlParts[1].componentsSeparatedByString("=")[1]
                self.dismissViewControllerAnimated(true, completion: nil)
               
            }
        }
        
        return true
    }
}
