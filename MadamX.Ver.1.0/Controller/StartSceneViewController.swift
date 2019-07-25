//
//  ViewController.swift
//  TestMyAR
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 20/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class StartSceneViewController: UIViewController, ARSCNViewDelegate {
    
    var counter2Button = 0
//
//    var myObj = [ContentStartScene] ()
//
//    var contentStartScene = [
//        "Go to your bedroom."
//    ]
    
    
    @IBOutlet weak var objectiveView2: UITextView!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var next2Button: UIButton!
    
    @IBOutlet var sceneView2: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView2.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView2.showsStatistics = true
        
        // Create a new scene
//        let scene2 = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
//        sceneView2.scene = scene2
    }
    
    @IBAction func next2ButtonPressed(_ sender: Any) {
        
        objectiveView2.text = "Take a picture of an object"
        
        next2Button.isEnabled = false
        
        
        counter2Button += 1
        
        if counter2Button == 2 {
            
            objectiveView2.text = "Take a photo"
            next2Button.isEnabled = false
            
        }
        
        
        
        
    }
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "toCamera", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView2.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView2.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
