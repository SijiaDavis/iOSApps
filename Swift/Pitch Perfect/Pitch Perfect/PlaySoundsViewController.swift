//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Sijia Davis on 12/30/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.hidden = true
        
        do{
            //let url=NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3")
            audioPlayer = try AVAudioPlayer(contentsOfURL: receivedAudio.filePathURL)
            audioPlayer?.enableRate = true
            
            audioEngine = AVAudioEngine()
            audioFile = try! AVAudioFile(forReading: receivedAudio.filePathURL)
        }
        catch{
        }
        
        do {
            let audioSession = AVAudioSession.sharedInstance()
            // withOption for route sound to speaker, without this it will be routed to the small speaker for on ear use
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord, withOptions: AVAudioSessionCategoryOptions.DefaultToSpeaker)
        } catch {
           
            print("Unable to create an audio session")
        }
    }
 
    func playAudio(speed: String){
        audioPlayer?.stop()
        if (speed=="slow") {
            audioPlayer?.rate = 0.5
        }
        else if (speed=="fast"){
            audioPlayer?.rate = 2
        }
        audioPlayer?.currentTime = 0
        audioPlayer?.play()
        stopButton.hidden = false
        
    }
    
    @IBAction func clickSlow(sender: UIButton) {
        playAudio("slow")
    }

    @IBAction func clickFast(sender: UIButton) {
        playAudio("fast")

    }
  
    @IBAction func playChipmunkVoice(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
  
    @IBAction func playDVVoice(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    
    func playAudioWithVariablePitch(pitch: Float) {
        
        // make sure nothing is playing
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        // create audioPlayerNode and attach it to audioEngine
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        // create pitchEffect and attach it to audioEngine
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        // Connect audioPlayerNode to changePitchEffect and then connect changePitchEffect to speak(output)
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        // to play audio
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        audioPlayerNode.play()
    }
    
    @IBAction func clickStop(sender: UIButton) {
        audioPlayer?.stop()
    }
}