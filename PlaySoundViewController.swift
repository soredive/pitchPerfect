//
//  PlaySoundViewController.swift
//  Pitch Perfect
//
//  Created by BS K on 2016. 4. 20..
//  Copyright © 2016년 BS K. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    // MARK: buttons
    @IBOutlet weak var rabbitButton : UIButton!
    @IBOutlet weak var snailButton : UIButton!
    @IBOutlet weak var vaderButton : UIButton!
    @IBOutlet weak var chipmunkButton : UIButton!
    @IBOutlet weak var echoButton : UIButton!
    @IBOutlet weak var reverbButton : UIButton!
    @IBOutlet weak var stopButton : UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: playing function
    @IBAction func startPlay(sender: UIButton!){
        print("play sound button")
        switch ButtonType(rawValue: sender.tag)! {
        case .Slow:
            playSound(rate: 1.5)
        case .Fast:
            playSound(rate: 0.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        configureUI(PlayingState.Playing)
    }
    
    @IBAction func stopPlay(sender: AnyObject!){
        print("stop play button")
        stopAudio()
    }
    
    enum ButtonType : Int {
        case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb
    }
    
    var recordedAudioURL : NSURL!
    
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : NSTimer!
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("play soudn view controller did loaded")
        // Do any additional setup after loading the view.
        setupAudio()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
