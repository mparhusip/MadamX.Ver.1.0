//
//  InsertNameViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Gabriella Gracia MT on 17/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit


extension UITextField
{
    func setPadding()
    {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func bottomBorder()
    {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

class InsertNameViewController: UIViewController, UITextFieldDelegate
{
    
    
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var userNameOut: UITextField!
    @IBOutlet weak var buttonSaveOut: UIButton!
    @IBOutlet weak var fromUserNameOut: UILabel!
    
    let userDef = UserDefaults.standard
    
//    var userDefArray = [String]()
    
     //var data = UserDefaults.standard.array(forKey: "word")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //fromUserNameOut.text = userDef.string(forKey: "word")
        
        buttonSaveOut.layer.cornerRadius = 10
        userNameOut.delegate = self
        userNameOut.setPadding()
        userNameOut.bottomBorder()
        userNameOut.autocapitalizationType = .words
        
        
//        var getUserName = InsertNameViewController()
//        getUserName = userDef.string(forKey: "word")
//        //userDef.set([], forKey: "word"
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let getUserName = segue.destination as! GetDataViewController
        getUserName.text = userDef.string(forKey: "word")!
        
//        if segue.identifier == "segue" {
//
//            var data = UserDefaults.standard
//            data.synchronize()
//            print("***************")
//            print(data.string(forKey: "word")!)
//
//        }
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func saveButton(_ sender: UIButton)
    {
        //var userDefArray = userDef.array(forKey: "word") as! [String]
       // userDefArray.append(userNameOut.text!)
        
        
        userDef.set(userNameOut.text, forKey: "word")
        
        print(userDef.string(forKey: "word")!)
        //fromUserNameOut.text = userDef.string(forKey: "word")
        
        let getUserName = GetDataViewController(nibName: "GetDataViewController", bundle: nil)
        getUserName.text = userDef.string(forKey: "word")!
        if userDef.synchronize() {
            performSegue(withIdentifier: "segue", sender: nil)
        }
        
//        navigationController?.pushViewController(getUserName, animated: true)
        
        //fromUserNameOut.text = "\(userDef.array(forKey: "word"))"
        
        // for multiple name by using array
        
//        if ((UserDefaults.standard.array(forKey: "word")) != nil) {
//            let data = (UserDefaults.standard.array(forKey: "word")) as! [String]
//            fromUserNameOut.text = data.joined(separator: ", ")
//        }
        
        
        
        print(NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true))
//        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
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
