//
//  ViewController.swift
//  Yoga Randomizer
//
//  Created by Sijia Davis on 1/2/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var yoga = ["Warrior Way", "Dance Day", "Simple Sequenced", "Standing Traveler", "Hold Strong", "Basic Training", "Happy Hips","Easy Flow"]

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: UIButton) {
        var randomNum = arc4random_uniform(UInt32(yoga.count))
        print(randomNum)
        resultLabel.text = yoga[Int(randomNum)]
        print(yoga[Int(randomNum)])
        
    }

}

