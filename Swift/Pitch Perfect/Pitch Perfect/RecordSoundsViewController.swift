//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Sijia Davis on 12/29/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var textField:  UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    var recordedAudio:RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
        recordButton.enabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func recordAudio(sender: UIButton) {
      // TODO: show record in progress
        textField.hidden = false
        stopButton.enabled = true
        stopButton.hidden = false
        recordButton.enabled = false
        
        // get the path to store the audio record
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        // give the record we are going to save a name
        let recordingName = "myRecord.wav"
        let pathArray = [dirPath, recordingName]
        
        // get the path where the audio is stored
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        // set up audio session
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        // initialize and prepare the audio recorder
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        
        // start recording
        audioRecorder.record()
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        
        // if successful
        if (flag) {
           
            // save audio record
            recordedAudio = RecordedAudio()
            recordedAudio.filePathURL = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
        
            // move to the next scene. AKA perform segue
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        }
        else {
            print("not successful")
            stopButton.hidden = true
            recordButton.enabled = true
            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "stopRecording"){
            
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
            
        }
    }

    @IBAction func stopRecording(sender: UIButton) {
        textField.hidden = true
        stopButton.enabled = false
        recordButton.enabled = true
        
        // stop the audio recorder
        audioRecorder.stop()
        
        // deactivate the audio session
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
}

