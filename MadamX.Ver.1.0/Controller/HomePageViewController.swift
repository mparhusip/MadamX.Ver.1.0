//
//  HomePageViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Stefani Kurnia Permata Dewi on 19/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import AVFoundation

class HomePageViewController: UIViewController, AVAudioPlayerDelegate {

    var homePlayer : AVAudioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //HOME PAGE SOUND
        let homeSound = Bundle.main.path(forResource: "In Game 3", ofType: "wav")
        do{
            try homePlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: homeSound!))
            homePlayer.numberOfLoops = -1
        }catch{
            print(error)
        }
        
        homePlayer.play()
        homePlayer.delegate = self
        
    }
    
 
    @IBAction func playgameButton(_ sender: Any) {
  
            performSegue(withIdentifier: "toPrologue", sender: nil)
           // homePlayer.pause()
       
    }
}
