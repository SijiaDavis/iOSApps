//
//  ViewController.swift
//  Animations
//
//  Created by Sijia Davis on 1/5/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 1
    var timer = NSTimer()

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // manually animate the image
    @IBAction func updateImage(sender: UIButton) {
        print(timer.valid)
        if timer.valid {
            // to "pause" a timer, invalidate the exisitng timer and throw it away
            timer.invalidate()
            button.setTitle("Play", forState: UIControlState.Normal)
            button.setTitle("Play", forState: UIControlState.Highlighted)
        
        }
        else {
            // to "resume" a timer, create a new timer
             timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo:nil, repeats: true)
            button.setTitle("Pause", forState: UIControlState.Normal)
            button.setTitle("Pause", forState: UIControlState.Highlighted)
        }
    }
    
    func doAnimation(){
        if counter < 7 {
            counter++
        }
        else {
            counter = 1
        }
        
        imageView.image = UIImage(named: "frame"+String(counter)+".png")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // set timer
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("doAnimation"), userInfo:nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    
    // iOS built-in animation
    override func viewDidLayoutSubviews() {
       
    
        // move the image out of the screen so the user don't see it
        imageView.center = CGPointMake(imageView.center.x - 400, imageView.center.y)
        
        // hide the image by making it transparent
        //imageView.alpha = 0
        
        // change the size of the image
        //imageView.frame = CGRectMake(100, 20, 0, 0)
    }

    override func viewDidAppear(animated: Bool) {
       
        UIView.animateWithDuration(1) { () -> Void in
             // animate the book image into the screen
            self.imageView.center = CGPointMake(self.imageView.center.x + 400, self.imageView.center.y)
            
            // fade the image in
            //self.imageView.alpha = 1
            
            // change the size of the image
            //self.imageView.frame = CGRectMake(100, 20, 100, 200)

        }
    }
*/
}

