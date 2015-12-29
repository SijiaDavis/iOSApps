//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Sijia Davis on 12/29/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var textField: UILabel!
    
    @IBAction func recordAudio(sender: UIButton) {
      // TODO: show record in progress
        textField.hidden = false
     
    
    }

    @IBAction func stopRecording(sender: UIButton) {
        textField.hidden = true
    }
}

