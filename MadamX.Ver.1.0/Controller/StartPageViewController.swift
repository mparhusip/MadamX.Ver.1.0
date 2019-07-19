//
//  StartPageViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Stefani Kurnia Permata Dewi on 17/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class StartPageViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
    }
    

    
    @IBAction func agreeButton(_ sender: Any) {
        performSegue(withIdentifier: "toViewController", sender: nil)
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
