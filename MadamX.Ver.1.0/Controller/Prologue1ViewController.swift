//
//  Prologue1ViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Stefani Kurnia Permata Dewi on 17/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import AVFoundation

class Prologue1ViewController: UIViewController {
    
    
    var typewritter : AVAudioPlayer = AVAudioPlayer()
    
    var counter = 0
    var obj = [Activity]()
    
    var content = [
        "Hello there, I’m the person who maintain this property. How can I call you?"

    ]
    
    
    
    @IBOutlet weak var prologueLabel: UILabel!
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateStory()
    }
    
    func animateStory() {
        prologueLabel.text = ""
        let prologueName = obj[counter].getName()
        
        //counter +=1
        for char in prologueName{
            prologueLabel.text! += "\(char)"
            RunLoop.current.run(until: Date()+0.07)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        animateStory()
        for i in 0..<content.count {
            obj.append(Activity(name: content[i]))
        }
   
        //Typewitter Sound
        let typeSound = Bundle.main.path(forResource: "typewriter", ofType: ".mp3")
        do{
            try typewritter = AVAudioPlayer(contentsOf: URL(fileURLWithPath: typeSound!))
        }catch{
            print(error)
        }
        
        typewritter.play()
    }
}


