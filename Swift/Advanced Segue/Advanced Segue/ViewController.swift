//
//  ViewController.swift
//  Advanced Segue
//
//  Created by Sijia Davis on 1/19/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

// global variable accessable by any class
var rowCounter: Int = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(rowCounter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

