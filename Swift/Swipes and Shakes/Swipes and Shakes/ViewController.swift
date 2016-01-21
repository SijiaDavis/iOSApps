//
//  ViewController.swift
//  Swipes and Shakes
//
//  Created by Sijia Davis on 1/20/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    var sounds = ["person","Cinematic","Evil","Video"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // code to detect swipe
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        // add the guesture to the whole view. you can also add swipe to only an object or part of the view
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        // add the guesture to the whole view. you can also add swipe to only an object or part of the view
        self.view.addGestureRecognizer(swipeUp)
        
        
    }
    
    // shake motion
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        // check if the event is a shake
        if event?.subtype == UIEventSubtype.MotionShake {
            var num = Int(arc4random_uniform(UInt32(sounds.count)))
            var nameOfSound = sounds[num]
            var fileLocation = NSBundle.mainBundle().pathForResource(nameOfSound, ofType: "mp3")
            do {
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                player.play()
            }
            catch {
                // something is wrong
            }
            
        }
    }
    func swiped(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("swiped right")
            case UISwipeGestureRecognizerDirection.Up:
                print("swiped up")
            default: break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

