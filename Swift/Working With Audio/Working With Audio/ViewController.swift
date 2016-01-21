//
//  ViewController.swift
//  Working With Audio
//
//  Created by Sijia Davis on 1/19/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var slider: UISlider!
    @IBAction func play(sender: AnyObject) {
     player.play()

        
    }

    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    @IBAction func adjustVolumn(sender: AnyObject) {
        // slider's value is from zero to one
        player.volume = slider.value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let audioPath = NSBundle.mainBundle().pathForResource("chopin-9-1-vetter", ofType: "mp3")!
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
        } catch {
            print(error)
        }

       
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

