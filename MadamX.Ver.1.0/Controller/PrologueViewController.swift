//
//  PrologueViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Indah Fitriany on 17/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class PrologueViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var nextButtonOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButtonOut.isHidden = true
        
        
        // Do any additional setup after loading the view.
        
    }
    
    
    
    @IBAction func up(_ sender: UIButton)
    {
        if textView.contentOffset.y < 100{
            textView.setContentOffset(CGPoint.zero, animated: true)
        }else{
            textView.setContentOffset(CGPoint(x: 0, y: textView.contentOffset.y-100), animated: true)
        }
    }
    
    
    @IBAction func down(_ sender: UIButton) {
//        if (textView.contentSize.height>(textView.frame.size.height+textView.contentOffset.y+100)){
//
//            textView.setContentOffset(CGPoint(x:0,y:textView.contentOffset.y + 100), animated: true);
//        }
//        else{
//            textView.setContentOffset(CGPoint(x:0,y:(textView.contentSize.height - textView.frame.size.height)), animated: true)
//        }
        
        if textView.contentOffset.y >  textView.contentSize.width - textView.frame.size.height{
            textView.setContentOffset(CGPoint(x: 0, y: textView.contentSize.height-textView.frame.size.height), animated: true)
            print("AAAAA")
        }else{
            textView.setContentOffset(CGPoint(x: 0, y: textView.contentOffset.y+100), animated: true)
        }
        if textView.contentOffset.y > textView.frame.height  {
            //print("Show Button")
            nextButtonOut.isHidden = false
            
        }
    }
    

//    @IBAction func nextButton(_ sender: Any)
//    {
//
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
