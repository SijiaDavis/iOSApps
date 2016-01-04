//
//  ViewController.swift
//  Permanent Storage
//
//  Created by Sijia Davis on 1/3/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //NSUserDefaults.standardUserDefaults().setObject("Sijia", forKey: "Name")
        
        let userName = NSUserDefaults.standardUserDefaults().objectForKey("Name") as! String
        print(userName)
        
        var arr = [1,2,3,4]
       // NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "MyArray")
        let returnedArr = NSUserDefaults.standardUserDefaults().objectForKey("MyArray") as! NSArray
        
        print(returnedArr)
        
        for var i in returnedArr {
            print(i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

