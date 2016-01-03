//
//  ViewController.swift
//  Is it Prime
//
//  Created by Sijia Davis on 1/2/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
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
        
        if let num = Int(textField.text!){
            var isPrime = true
            var start = 2
            
            if (num == 1){
                isPrime = false
            }
            
            if (num != 1 && num != 2) {
                
                while start<num {
                    if (num%start==0){
                        isPrime = false
                    }
                    start++
                }
            }
            if (isPrime){
                resultLabel.text = "\(num) is a prime number"
            }
            else {
                resultLabel.text = "\(num) is not a prime number"
            }
        } else{
            resultLabel.text = "please enter a number"
        }
        
    }

}

