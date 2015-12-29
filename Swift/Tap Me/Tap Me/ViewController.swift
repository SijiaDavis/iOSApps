//
//  ViewController.swift
//  Tap Me
//
//  Created by Sijia Davis on 11/23/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    
    var count:Int   = 0;
    var seconds:Int = 0;
    var timer       = NSTimer();
    
    @IBAction func buttonPressed()
    {
        count++;
        scoreLabel.text = "Score \n\(count)";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGame()
    {
        seconds = 30;
        count   = 0;
        
        timerLabel.text = "Time: \(seconds)";
        scoreLabel.text = "Score: \(count)";
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true);
    }
    
    func subtractTime()
    {
        seconds--;
        timerLabel.text = "Time: \(seconds)";
        
        if (seconds == 0)
        {
            // Stop the timer from counting past 0.
            timer.invalidate();
            
            // Alert message.
            let alert = UIAlertController(title: "Time is up!",
                message: "You scored \(count) points",
                preferredStyle: UIAlertControllerStyle.Alert);
            
            alert.addAction(UIAlertAction(title:"Play Again", style:UIAlertActionStyle.Default,handler: {
                action in self.setupGame();
            }));
            
            presentViewController(alert, animated: true, completion: nil);
        }
    }


}

