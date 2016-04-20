//
//  PlaySoundViewController.swift
//  Pitch Perfect
//
//  Created by BS K on 2016. 4. 20..
//  Copyright © 2016년 BS K. All rights reserved.
//

import UIKit

class PlaySoundViewController: UIViewController {
    
    @IBOutlet weak var btnRabbit : UIButton!
    @IBOutlet weak var btnSnail : UIButton!
    @IBOutlet weak var btnDarthbader : UIButton!
    @IBOutlet weak var btnChipmunk : UIButton!
    @IBOutlet weak var btnEcho : UIButton!
    @IBOutlet weak var btnRevert : UIButton!
    
    @IBAction func playSound(sender: UIButton!){
        print("play sound button")
    }
    
    @IBAction func stopPlay(sender: AnyObject!){
        print("stop play button")
    }
    
    enum ButtonType : Int {
        case Slow = 0, fast, chipmunk, darthbader, echo, revert
    }
    
    var recordedAudioURL : NSURL!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("play soudn view controller did loaded")
        // Do any additional setup after loading the view.
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
