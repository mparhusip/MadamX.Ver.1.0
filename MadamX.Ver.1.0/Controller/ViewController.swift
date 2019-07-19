//
//  ViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 16/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import CoreML
import CoreLocation
import MapKit


class ViewController: UIViewController, ARSCNViewDelegate, CLLocationManagerDelegate {
    
    var worldMapURL: URL = {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("worldMapURL")
        }
        catch {
            fatalError("Error getting world map URL from document directory.")
        }
    } ()
    
    func archive(worldMap: ARWorldMap) throws {
        let data = try NSKeyedArchiver.archivedData(withRootObject: worldMap, requiringSecureCoding: true)
        try data.write(to: self.worldMapURL, options: [.atomic])
    }
    
    var locationManager: CLLocationManager!
    var latestLocation: CLLocation?
    
    
    func setupLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        locationManager?.desiredAccuracy = kCLDistanceFilterNone
        
        locationManager?.startUpdatingLocation()
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("LocationManager didFailWithError: %@", error)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("LocationManager didUpdateLocations: %@", locations)
        
        if (locations.count) > 0 {
            latestLocation = locations.last!
            
        }
        
    }
    

   
    
    @IBOutlet weak var objectiveView: UITextView!
    
    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var setLabel = UILabel()
    
    var counterButton = 0
    
    var contentStartUp = [StartUpContent] ()
    
    var contentStart = [
        "Let's start with your bedroom. \n(Go to your bedroom and scan your room.",
        "Now, let's go to the bathroom. \n(Go to your bathroom and scan the room.",
        "The living room is the best part in my opinion. \n(Go to your living room and scan the room)",
        "What if we see the kitchen?. \n(Go to the kitchen and scan the room",
        "Well, do you wanna to see the outside?"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        
        setLabel = UILabel(frame: CGRect(x: sceneView.frame.size.width / 2, y: sceneView.frame.size.height / 2, width: self.view.frame.size.width - 12*2, height: self.view.frame.size.height - 10*2))
        
        setLabel.numberOfLines = 0
        
        for i in 0..<contentStart.count {
            contentStartUp.append(StartUpContent(startUpContent: contentStart[i]))
            
        }
        
        
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        
        print(contentStartUp[counterButton].getStartUpContent())
        objectiveView.text = contentStartUp[counterButton].getStartUpContent()
        counterButton+=1
        
        if counterButton == 5 {
            
           nextButton.removeFromSuperview()

            let buttonYes = UIButton.init(type: UIButton.ButtonType.roundedRect)
           
            buttonYes.frame = CGRect(x: 635, y: 320, width: 70, height: 55)
//            buttonYes.center = view.center
            buttonYes.setTitle("Yes", for: UIControl.State.normal)
            buttonYes.setTitleColor(.white, for: UIControl.State.normal)
            buttonYes.backgroundColor = #colorLiteral(red: 1, green: 0.6065336466, blue: 0, alpha: 1)
            self.view.addSubview(buttonYes)
            
            let buttonNo = UIButton.init(type: UIButton.ButtonType.roundedRect)
            buttonNo.frame = CGRect(x: 743, y: 320, width: 70, height: 55)
            buttonNo.setTitle("No", for: UIControl.State.normal)
            buttonNo.setTitleColor(.white, for: UIControl.State.normal)
            buttonNo.backgroundColor = #colorLiteral(red: 1, green: 0.6065336466, blue: 0, alpha: 1)
            self.view.addSubview(buttonNo)
        }

        
        sceneView.session.getCurrentWorldMap { (worldMap, Error) in
            guard let worldMap = worldMap else {
                return self.setLabel.text = "Error getting current world map"
            }
            
            do {
                try self.archive(worldMap: worldMap)
                DispatchQueue.main.async {
                    self.setLabel.text = "World Map is saved"
                }
            } catch {
                fatalError("Error saving world map: \(Error!.localizedDescription)")
            }
            
        }
        
        
            //        if counterButton == 5 {
//            
//        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
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
