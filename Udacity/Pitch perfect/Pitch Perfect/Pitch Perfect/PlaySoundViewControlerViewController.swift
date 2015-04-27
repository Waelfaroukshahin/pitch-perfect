//
//  PlaySoundViewControlerViewController.swift
//  Pitch Perfect
//
//  Created by Wael Farouk on 4/21/15.
//  Copyright (c) 2015 Wael Farouk. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundViewControlerViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()
    var receivedAudio: RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    //if  var filePath = NSBundle.mainBundle().pathForResource("SONG", ofType: "mp3"){
            
         // var filepathUrl = NSURL.fileURLWithPath(filePath)

 
       //}else {
      // println("file not exist")

       // }
        
        
        
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filpathurl, error: nil)
        audioPlayer.enableRate = true
    
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filpathurl, error: nil)
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func PlaySlowSound(sender: AnyObject) {
        
    audioPlayer.stop()
    audioPlayer.rate = 0.5
    audioPlayer.currentTime = 0.0
    audioPlayer.play()
        
        
              // Removed deprecated use of AVAudioSessionDelegate protocol

    }
    
    
    
    @IBAction func PlayfastAudio(sender: AnyObject) {
      
        
        audioPlayer.stop()
        audioPlayer.rate = 2
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
        
        
    }
    
    
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    
    @IBAction func playDarthvaderAudio(sender: AnyObject) {
        
         playAudioWithVariablePitch(-1000)
    }
    
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
    
        
        
        
        playAudioWithVariablePitch(1000)
        
        
        
    }
    
    @IBAction func StopAudio(sender: AnyObject) {
        
        audioPlayer.stop()
        
    }
    /*
    @IBAction func PlayfastAudio(sender: AnyObject) {
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
