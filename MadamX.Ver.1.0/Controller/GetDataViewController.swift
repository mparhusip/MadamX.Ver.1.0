//
//  GetDataViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Gabriella Gracia MT on 17/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class GetDataViewController: UIViewController
{

    var text:String = ""
    
    @IBOutlet weak var warmestLabel: UILabel!
    @IBOutlet weak var nextOut: UIButton!
    @IBOutlet weak var fromUserNameOut:UILabel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        fromUserNameOut?.text = text
        
        nextOut.layer.cornerRadius = 10
        
        warmestLabel.layer.borderColor = UIColor.black.cgColor;
        warmestLabel.layer.borderWidth = 2.0
        warmestLabel.layer.cornerRadius = 1.0
        
        
    }
        
    @IBAction func nextPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toArView", sender: nil)
        
    }
}
