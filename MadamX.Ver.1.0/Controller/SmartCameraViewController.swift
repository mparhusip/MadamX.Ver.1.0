//
//  SmartCameraViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Gabriella Gracia MT on 18/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

    
    import UIKit
    import AVKit
    import AVFoundation
    import CoreData

let entityName = "StoredImage"
    
    class SmartCameraViewController: UIViewController, AVCapturePhotoCaptureDelegate
    {
        let captureSession = AVCaptureSession()
        var photoOutput = AVCapturePhotoOutput()
        var outputImageView = UIImageView()
        var videoPreviewLayer: AVCaptureVideoPreviewLayer!
//        let previewLayer = AVCaptureVideoPreviewLayer()
        
        
        
        
        
        
        private var savedObjects = [NSManagedObject]()
        private var images = [UIImage]()
        private var managedContext: NSManagedObjectContext!
        
        @IBOutlet weak var smartCamOut: UIButton!
      
        override func viewDidLoad()
        {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
//        }
        
//        @IBAction func smartCamButton(_ sender: Any)
//        {
//            let captureSession = AVCaptureSession()
//            captureSession.sessionPreset = .photo
//
//            guard let captureDevice = AVCaptureDevice.default(for: .video) else {return}
//            guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {return}
//
//            captureSession.addInput(input)
//            captureSession.startRunning()
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer()
            videoPreviewLayer.connection?.videoOrientation = .landscapeRight
            videoPreviewLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 750)
            videoPreviewLayer.isGeometryFlipped = true
            view.layer.addSublayer(videoPreviewLayer)
            
            let xPosition = (UIScreen.main.bounds.maxX) - 210
            let yPosition = (UIScreen.main.bounds.maxY) - 250
            let buttonRect = CGRect(x: Int(xPosition), y: Int(yPosition), width: 80, height: 80)
            let buttonShoot = UIButton(frame: buttonRect)
            
            
            buttonShoot.backgroundColor = UIColor.white
            buttonShoot.layer.cornerRadius = buttonShoot.frame.width / 2.0
            buttonShoot.layer.masksToBounds = true
            buttonShoot.autoresizingMask = [.flexibleLeftMargin, .flexibleBottomMargin]
            
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(buttonShootDidTap))
            buttonShoot.addGestureRecognizer(tap)
            
            view.addSubview(buttonShoot)
            
            outputImageView.isHidden = true
            outputImageView.frame = CGRect(x: (xPosition / 7) - 20, y: yPosition + 60 , width: 250, height: 150) //posisi
            outputImageView.layer.borderColor = UIColor.gray.cgColor
            outputImageView.layer.borderWidth = 10
            outputImageView.layer.masksToBounds = true
            outputImageView.contentMode = .scaleAspectFill
            
            view.addSubview(outputImageView)
            
            configuringSession()
            
        }
        
        @objc func buttonShootDidTap() {
            
            let settings = AVCapturePhotoSettings()
            photoOutput.capturePhoto(with: settings, delegate: self)
            
            //print(NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true))
            outputImageView.isHidden = false
    
            
        }
        

    
    func configuringSession() {
        
        captureSession.beginConfiguration()
        
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {return}
        
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice),  captureSession.canAddInput(videoDeviceInput) else { return }
        captureSession.addInput(videoDeviceInput)
        
        guard captureSession.canAddOutput(photoOutput) else {return}
        
        captureSession.sessionPreset = .photo
        
        captureSession.addOutput(photoOutput)
        
        captureSession.commitConfiguration()
        
        DispatchQueue.main.async {
            self.videoPreviewLayer.session = self.captureSession
            self.captureSession.startRunning()
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.captureSession.stopRunning()
    }
        
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//            PreviewLayer.addSubview(photoOutput)
            //UIImage(data: photo.fileDataRepresentation())
            
            //Dapet Data
            guard let data = photo.fileDataRepresentation(),
                let image = UIImage(data: data) else {
                    return
            }
            print("Image Data ", data)
            
            
            //save Image
            let imageControll = ImageController()
            imageControll.saveImage(image: image)
            
            
            
            self.outputImageView.image = image
        }
}

class PreviewLayer: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
}

