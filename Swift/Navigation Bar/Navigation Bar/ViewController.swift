//
//  ViewController.swift
//  Navigation Bar
//
//  Created by Sijia Davis on 1/2/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countDown = 30
    
    var timer:NSTimer = NSTimer()
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var stopButton: UIBarButtonItem!
    
    @IBAction func playButtonPressed(sender: UIBarButtonItem) {
        
        // selector is the functin or method we want to run everytime the timer hits 1 sec
        // here we want the result function to run every second
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("decreaseTimer"), userInfo: nil, repeats: true)
        pauseButton.enabled = true
        stopButton.enabled = true

    }
    
    @IBAction func pauseButtonPressed(sender: UIBarButtonItem) {
        // to pause timer, use timer.invalidate()
        timer.invalidate()
        playButton.enabled = true
        pauseButton.enabled = false
        
        
    }
    
    @IBAction func stopButtonPressed(sender: UIBarButtonItem) {
        timer.invalidate()
        timeLabel.text = "Time"
        countDown = 30
        playButton.enabled = true
        pauseButton.enabled = false
        stopButton.enabled = false
    }
    
    
    
    func decreaseTimer() {
        if (countDown>1){
           countDown--
            timeLabel.text = String(countDown)
            playButton.enabled = false
        }
        else {
            timer.invalidate()
            timeLabel.text = "Time"
            playButton.enabled = true
            pauseButton.enabled = false
        }
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        pauseButton.enabled = false
        stopButton.enabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

