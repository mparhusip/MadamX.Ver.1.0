//
//  LogoPageViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Stefani Kurnia Permata Dewi on 18/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import AVFoundation

class LogoPageViewController: UIViewController, AVAudioPlayerDelegate {

    var logoPlayer: AVAudioPlayer = AVAudioPlayer()
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        performSegue(withIdentifier: "progressView", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //LOGO PAGE SOUND
        let logoSound = Bundle.main.path(forResource: "page awal- LOGO", ofType: ".mp3")
        do{
            try logoPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: logoSound!))
        }catch{
            print(error)
        }
        
        logoPlayer.play()
        logoPlayer.delegate = self

    }

}
