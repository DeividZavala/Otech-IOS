//
//  RadioViewController.swift
//  Otech
//
//  Created by David Zavala on 14/02/17.
//  Copyright © 2017 David Zavala. All rights reserved.
//

import UIKit
import AVFoundation

class RadioViewController: UIViewController {
    
    var player = AVPlayer()
    var playing = false
    
    @IBOutlet var pause: UIButton!
    @IBAction func pause(_ sender: UIButton) {
        if playing{
            player.pause()
            playing = false
            pause.setImage(UIImage(named:"play-button-icon-png-26"), for: .normal)
        }else{
            player.play()
            playing = true
            pause.setImage(UIImage(named:"pause-button-png-6"), for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.play(url:"https://www.uaeh.edu.mx/radio-shoutcast/;stream.mp3#.m4a")
        //AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)

        let audioSession = AVAudioSession.sharedInstance()
        do{
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
        }
        catch{
            print(error)
        }

        
    }
    
    func play(url:String) {
        let playerItem = AVPlayerItem(url:URL(string:url)!)
        player = AVPlayer(playerItem:playerItem)
        player.rate = 1.0;
        player.play()
        playing = true
    }

    

}
