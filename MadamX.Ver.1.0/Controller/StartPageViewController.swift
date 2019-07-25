//
//  StartPage1ViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Indah Fitriany on 18/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import AVFoundation

class StartPageViewController: UIViewController {

    var counter = 0
    
    var obj = [Activity]()
    
    var  typeWriterPlayer : AVAudioPlayer = AVAudioPlayer()
    
    
    @IBOutlet weak var storyLabel: UILabel!
    
    
    var content = [
        "I think that's all.",
        "I hope you really enjoy the place.",
        "I am glad that this kind of place found a new owner.",
        "She would love it.",
        "WHO?????.....",
        "I am talking about the previous owner.",
        "No one really knows her that well but we call her Ms Mardo",
        "That's not her real name though",
        "She used to live here for years but she moved out around 5 months ago",
        "If you found something that doesn't belong to you, that might be hers.",
        "Rumors that she hides her fortune in random place around the house."
    ]
    
    
    @IBAction func nextStoryButtonTap(_ sender: UIButton) {
        print(obj[counter].getName())
        storyLabel.text = ""
        
        counter+=1
        starttypeWritterMusic()
        
        
        if counter == 11 {
            
        performSegue(withIdentifier: "prologue_segue", sender: nil)
        }else{
            animateStory()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.starttypeWritterMusic()
        self.animateStory()
    
    }
    
    func animateStory() {
        storyLabel.text = ""
        let storyName = obj[counter].getName()
//        counter+=1
        
        for char in storyName {
            storyLabel.text! += "\(char)"
            RunLoop.current.run(until: Date()+0.07)
        }
        
        typeWriterPlayer.stop()
    }
    
     func starttypeWritterMusic() {
     let typewritterSound = Bundle.main.path(forResource: "Line 8", ofType: ".mp3")
     let url = NSURL(fileURLWithPath: typewritterSound!)
     typeWriterPlayer = try! AVAudioPlayer(contentsOf: url as URL)
     typeWriterPlayer.prepareToPlay()
     typeWriterPlayer.play()
     
     }
    
    @IBOutlet weak var nextStory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<content.count {
            obj.append(Activity(name: content[i]))
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
