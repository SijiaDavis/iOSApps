//
//  ViewController.swift
//  play music
//
//  Created by Sijia Davis on 1/19/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    

    @IBAction func play(sender: AnyObject) {
        player.play()
    }
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }

    @IBAction func stop(sender: AnyObject) {
        player.pause()
        
        do{
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("leanon", ofType: "mp3")!))
             song.maximumValue = Float(player.duration)
             song.value = 0.0
        }
        catch {
            print(error)
        }
    }
    
    @IBOutlet weak var volumn: UISlider!
    @IBAction func adjustVolumn(sender: AnyObject) {
        player.volume = volumn.value
    }
    
    @IBOutlet weak var song: UISlider!
    
    @IBAction func adjustSong(sender: AnyObject) {
        player.currentTime = Double(song.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
             try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("leanon", ofType: "mp3")!))
            song.maximumValue = Float(player.duration)
            song.value = 0.0
        }
        catch {
            print(error)
        }
       
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateSlider"), userInfo: nil, repeats: true)
    
    }
    
    func updateSlider(){
        song.value = Float(player.currentTime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

