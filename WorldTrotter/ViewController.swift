//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Cara on 2/18/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import UIKit
import WebKit

// This was taken from Apple's documentation on WKWebView
class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView! // creates a reference for a WKWebView
    
    override func loadView() {
        // configure the view for webView
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        // specify the url and have the webview load that url
        let myURL = URL(string:"https://www.minneapolis.edu/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
