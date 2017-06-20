//
//  WebViewViewController.swift
//  Final Project
//
//  Created by Timothy Sirchuk on 6/10/17.
//  Copyright © 2017 Timothy Sirchuk. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController {
    
    var webSite: String?;
    var Name: String?;

    @IBOutlet weak var WebView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
            let requestURL = URL(string: webSite!)
            let request = URLRequest(url: requestURL! as URL)
            WebView.loadRequest(request as URLRequest)
            
            navigationItem.title = Name;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}
