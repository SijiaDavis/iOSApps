//
//  ViewController.swift
//  Webview
//
//  Created by Sijia Davis on 1/20/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        var url = NSURL(string: "https://www.youtube.com")
//        var request = NSURLRequest(URL:url!)
//        webview.loadRequest(request)
        var html = "<html><body><h1>MY PAGE</h1><p>This is my webpage</p></body></html>"
        webview.loadHTMLString(html, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

