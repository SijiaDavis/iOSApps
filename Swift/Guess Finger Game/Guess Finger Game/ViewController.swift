//
//  ViewController.swift
//  Guess Finger Game
//
//  Created by Sijia Davis on 1/2/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldValue: UITextField!
    
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
        let finger = String(arc4random_uniform(6))
        
        if (textFieldValue.text! == finger){
            resultLabel.text = "You got it!"
        }
        else {
            resultLabel.text = "Sorry, the number is actually \(finger)"
        }
        
    }

}

