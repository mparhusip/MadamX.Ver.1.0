//
//  StartPage1ViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Indah Fitriany on 18/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class StartPageViewController: UIViewController {

    var counter = 0
    
    var obj = [Activity]()
    
    @IBOutlet weak var storyLabel: UILabel!
    
    
    var content = [
        "I think that's all.",
        "I hope you really enjoy the place.",
        "I am glad that this kind of place found a new owner.",
        "She would love it.",
        "WHO?????.....",
        "I am talking about the previous owner.",
        "She was 89 years old when she died here few months ago.",
        "She's been living here for years but no one actually knows her that well."
    ]
    
    @IBAction func nextStoryButtonTap(_ sender: UIButton) {
        print(obj[counter].getName())
        storyLabel.text = ""
        
        counter+=1
        
        
        if counter == 8 {
            
        performSegue(withIdentifier: "prologue_segue", sender: nil)
        }else{
            animateStory()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
