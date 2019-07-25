//
//  progressView.swift
//  MadamX.Ver.1.0
//
//  Created by Stefani Kurnia Permata Dewi on 17/07/19.
//  Copyright © 2019 Apple Academy. All rights /Users/stefanikurnia/Documents/MadamX.Ver.1/MadamX.Ver.1.0/
//

import UIKit
import AVFoundation

class progressView: UIViewController {

    @IBOutlet weak var progressView: UIView!
  
    var timer = Timer()
    var progressPlayer : AVAudioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activateTimer()
        progressView.layer.cornerRadius = 10
        
        //LOGO PAGE SOUND
//
       
        
        
}
    
    func activateTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(screenTransition), userInfo: nil, repeats: false)
        
        let ProgressSound = Bundle.main.path(forResource: "Progress Page", ofType: ".mp3")
        do{
            try progressPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: ProgressSound!))
        }catch{
            print(error)
        }

         progressPlayer.play()
    }
    
    @objc func screenTransition(){
        self.timer.invalidate()
        
        performSegue(withIdentifier: "toDisclaimer", sender: self)
        
        
    }
}
