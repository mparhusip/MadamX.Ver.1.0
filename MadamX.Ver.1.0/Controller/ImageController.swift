//
//  ImageController.swift
//  MadamX.Ver.1.0
//
//  Created by Gabriella Gracia MT on 19/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import Foundation
import UIKit


class ImageController: ViewController {

    static let shared = ImageController()
    
    let model = ModelController()

    let fileManager = FileManager.default
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

func saveImage(image: UIImage) -> String? {
    let date = String( Date.timeIntervalSinceReferenceDate )
    let imageName = date.replacingOccurrences(of: ".", with: "-") + ".png"
    
    if let imageData = image.pngData() {
        do {
            let filePath = documentsPath.appendingPathComponent(imageName)
//            model.fetchImageObjects()
            
            //Save image to path
            try imageData.write(to: filePath)
            print("path, ", filePath)
            
            //save image to core data
            model.saveImageObject(image: image, imageName: imageName)
            
            print("\(imageName) was saved.")
            
            return imageName
        } catch let error as NSError {
            print("\(imageName) could not be saved: \(error)")
            
            return nil
        }
        
    } else {
        print("Could not convert UIImage to png data.")
        
        return nil
    }
}

func fetchImage(imageName: String) -> UIImage? {
    let imagePath = documentsPath.appendingPathComponent(imageName).path
    
    guard fileManager.fileExists(atPath: imagePath) else {
        print("Image does not exist at path: \(imagePath)")
        
        return nil
    }
    
    if let imageData = UIImage(contentsOfFile: imagePath) {
        return imageData
    } else {
        print("UIImage could not be created.")
        
        return nil
    }
}
    
    func deleteImage(imageName: String) {
        let imagePath = documentsPath.appendingPathComponent(imageName)
        
        guard fileManager.fileExists(atPath: imagePath.path) else {
            print("Image does not exist at path: \(imagePath)")
            
            return
        }
        
        do {
            try fileManager.removeItem(at: imagePath)
            
            print("\(imageName) was deleted.")
        } catch let error as NSError {
            print("Could not delete \(imageName): \(error)")
        }
    }
}
