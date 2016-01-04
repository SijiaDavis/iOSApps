//
//  ViewController.swift
//  Downloading web content
//
//  Created by Sijia Davis on 1/4/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string:"http://www.stackoverflow.com")!  // unwrap it in the beginning
        
        webView.loadRequest(NSURLRequest(URL: url))
        
        
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
//            // will happen when task completes
//            if let urlContent = data {
//               let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)// similar to string, but allows encoding
//                
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    //print(webContent)
//                    // show webcontent in the web View
//                    self.webView.loadHTMLString(String(webContent!), baseURL: nil)
//                })
//                
//               
//                
//            } else {
//                // show error message
//            }
//        }
//        
//        task.resume()
//        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

