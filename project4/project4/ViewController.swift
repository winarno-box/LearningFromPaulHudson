//
//  ViewController.swift
//  project4
//
//  Created by agus winarno on 8/22/20.
//  Copyright © 2020 istana code. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
           webView = WKWebView()
           webView.navigationDelegate = self
           view = webView
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://www.hackingwithswift.com"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        // Load url request to webView
        webView.load(request)
        
        // add navigation controll go back preview page
        webView.allowsBackForwardNavigationGestures = true
        
    }


}

