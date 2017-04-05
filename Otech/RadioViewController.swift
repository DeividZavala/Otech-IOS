//
//  RadioViewController.swift
//  Otech
//
//  Created by David Zavala on 14/02/17.
//  Copyright © 2017 David Zavala. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class RadioViewController: UIViewController {
    
    var player : AVPlayer!
    
    /*var player = AVPlayer()
    var playing = false*/
    
    @IBOutlet var pause: UIButton!
    @IBAction func pause(_ sender: UIButton) {
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
        self.becomeFirstResponder()
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        try! AVAudioSession.sharedInstance().setActive(true)
        
        let url = URL(string: "https://www.uaeh.edu.mx/radio-shoutcast/;stream.mp3#.m4a")
        let sound = AVPlayerItem(url: url!)
        
        if player == nil || player.rate != 1.0 {
            self.player = try! AVPlayer(playerItem: sound)
            self.player.allowsExternalPlayback = true
            self.player.play()
            pause.setImage(UIImage(named:"pause-button-png-6"), for: .normal)
        }else{
            self.player.pause()
            pause.setImage(UIImage(named:"play-button-icon-png-26pause-button-png-6"), for: .normal)
        }
        
        
        /*if playing{
            player.pause()
            playing = false
            pause.setImage(UIImage(named:"play-button-icon-png-26"), for: .normal)
        }else{
            player.play()
            playing = true
            pause.setImage(UIImage(named:"pause-button-png-6"), for: .normal)
        }*/
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let playerCenter = MPRemoteCommandCenter.shared()
        
        playerCenter.playCommand.isEnabled = true
        playerCenter.playCommand.addTarget(self, action: #selector(self.pause(_:)))
        
        /*self.play(url:"https://www.uaeh.edu.mx/radio-shoutcast/;stream.mp3#.m4a")
        //AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)

        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
        }
        catch{
            print(error)
        }*/

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*func play(url:String) {
        let playerItem = AVPlayerItem(url:URL(string:url)!)
        player = AVPlayer(playerItem:playerItem)
        player.rate = 1.0;
        player.play()
        playing = true
    }*/

    

}
