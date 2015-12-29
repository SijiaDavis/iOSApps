//
//  ViewController.swift
//  Tap Me
//
//  Created by Sijia Davis on 11/23/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    
    var count:Int   = 0;
    var seconds:Int = 0;
    var timer       = NSTimer();
    
    var buttonBeep:      AVAudioPlayer?
    var secondBeep:      AVAudioPlayer?
    var backgroundMusic: AVAudioPlayer?
    
    @IBAction func buttonPressed()
    {
        count++;
        scoreLabel.text = "Score \n\(count)";
        buttonBeep?.play();
    }
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString)->AVAudioPlayer?
    {
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String);
        let url = NSURL.fileURLWithPath(path!);
        
        var audioPlayer:AVAudioPlayer?
        
        do
        {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url);
        }
        catch
        {
            print("Player not available");
        }
        
        return audioPlayer;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Set background colors.
        view.backgroundColor       = UIColor(patternImage: UIImage(named: "bg_tile.png")!);
        scoreLabel.backgroundColor = UIColor(patternImage: UIImage(named: "field_score.png")!);
        timerLabel.backgroundColor = UIColor(patternImage: UIImage(named: "field_time.png")!);

        // Create audio players
        if let buttonBeep = self.setupAudioPlayerWithFile("ButtonTap", type: "wav")
        {
            self.buttonBeep = buttonBeep;
        }
        if let secondBeep = self.setupAudioPlayerWithFile("SecondBeep", type: "wav")
        {
            self.secondBeep = secondBeep;
        }
        if let backgroundMusic = self.setupAudioPlayerWithFile("HallOfTheMountainKing", type: "mp3")
        {
            self.backgroundMusic = backgroundMusic;
        }
        
        // Start the game.
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
        
        backgroundMusic?.volume = 0.5;
        backgroundMusic?.play();
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true);
    }
    
    func subtractTime()
    {
        seconds--;
        timerLabel.text = "Time: \(seconds)";
        secondBeep?.play();
        
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

