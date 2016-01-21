//
//  ViewController.swift
//  Download an image
//
//  Created by Sijia Davis on 1/20/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "https://i.ytimg.com/vi/Sjh-IV5IamY/maxresdefault.jpg")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            if error != nil {
                print(error)
                
            } else {
                
                var documentDirectory:String?
                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    documentDirectory = String(paths[0])
                    let savePath = documentDirectory! + "/flappybird.jpg"
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    // taks is run in the background thread. let's update ui from the main thread
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.image.image = UIImage(named: savePath)
                        
                        
                    })
                }
                

            }
        }
        task.resume()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

