//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by BS K on 2016. 3. 15..
//  Copyright © 2016년 BS K. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController , AVAudioRecorderDelegate {
    @IBOutlet var showingLabel: UILabel!
    @IBOutlet var recordButtonStart: UIButton!
    @IBOutlet var recordButtonStop: UIButton!
    
    var audioRecorder : AVAudioRecorder!
    
    func record() {
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let recordFileName = "voiceRecordFile.wav"
        let pathArray = [dirPath, recordFileName]
//        print(pathArray)
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func stopRecord(){
        audioRecorder.stop()
        
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
        
    }
	
	func setBtnStatus(type: String){
		switch type {
		case "record":
			recordButtonStart.enabled = false
			recordButtonStop.enabled = true
			showingLabel.text = "Recording in Progress"
		case "stop":
			recordButtonStart.enabled = true
			recordButtonStop.enabled = false
			showingLabel.text = ""
		default:
			break
		}
	}
	
    @IBAction func btnClicked(sender: UIButton) {
        print("clicked")
		setBtnStatus("record")
        record()
    }
    
    
    @IBAction func stopBtnClicked(sender: UIButton) {
		setBtnStatus("stop")
        stopRecord()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
		showingLabel.text = "Tap to Record"
        recordButtonStop.enabled = false
        print("view will appear")
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("record has been finished")
        
        if flag {
            performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        }else{
            print("record has been failed")
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "stopRecording" {
            let playSoundVC = segue.destinationViewController as! PlaySoundViewController
            let recordedURL = sender as! NSURL
            playSoundVC.recordedAudioURL = recordedURL
            
        }
    }
    
}

