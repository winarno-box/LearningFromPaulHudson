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
        
        // add navigation in right bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let urlString = "https://www.hackingwithswift.com"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        // Load url request to webView
        webView.load(request)
        
        // add navigation controll go back preview page
        webView.allowsBackForwardNavigationGestures = true
        
    }
    
    @objc func openTapped(){
        let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        guard let actionTitle =  action.title else {return}
        guard let url = URL(string: "https://" + actionTitle) else {return}
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }


}

