//
//  ModelController.swift
//  MadamX.Ver.1.0
//
//  Created by Gabriella Gracia MT on 19/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class ModelController: ViewController {

static let shared = ModelController()

let entityName = "StoredImage"

private var savedObjects = [NSManagedObject]()
private var images = [UIImage]()
    private var managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var storedImages = [StoredImage]()

//init() {
//    super.init()
//    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//    managedContext = appDelegate.persistentContainer.viewContext
//
//    fetchImageObjects()
//}
//
//
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    

func fetchImageObjects() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    managedContext = appDelegate.persistentContainer.viewContext
    
    let imageObjectRequest: NSFetchRequest = StoredImage.fetchRequest()
    
    do {
        savedObjects = try managedContext.fetch(imageObjectRequest)
        
        images.removeAll()
        
        for imageObject in savedObjects {
            let savedImageObject = StoredImage(context: managedContext)
            
//            guard savedImageObject.imageName != nil else { return }
            
            let storedImage = ImageController.shared.fetchImage(imageName: savedImageObject.imageName!)
            
            if let storedImage = storedImage {
                images.append(storedImage)
            }
        }
    } catch let error as NSError {
        print("Could not return image objects: \(error)")
    }
}

    func saveImageObject(image: UIImage, imageName: String) {
//    let imageName = ImageController.shared.saveImage(image: image)
    
//    if let imageName = imageName {
//        let coreDataEntity = NSEntityDescription.entity(forEntityName: entityName, in: managedContext)
//        let newImageEntity = NSManagedObject(entity: coreDataEntity!, insertInto: managedContext) as! StoredImage
        //deklarasi object model
        let storeImg = StoredImage(context: managedContext)
        
//        set value object model
        storeImg.imageName = imageName
        
        //append object model
        storedImages.append(storeImg)
        
        do {
            try managedContext.save()
            
            images.append(image)
            
            print("\(imageName) was saved in new object.")
        } catch let error as NSError {
            print("Could not save new image object: \(error)")
        }
//    }
}
    
    func deleteImageObject(imageIndex: Int) {
        guard images.indices.contains(imageIndex) && savedObjects.indices.contains(imageIndex) else { return }
        
        let imageObjectToDelete = savedObjects[imageIndex] as! StoredImage
        let imageName = imageObjectToDelete.imageName
        
        do {
            managedContext.delete(imageObjectToDelete)
            
            try managedContext.save()
            
            if let imageName = imageName {
                ImageController.shared.deleteImage(imageName: imageName)
            }
            
            savedObjects.remove(at: imageIndex)
            images.remove(at: imageIndex)
            
            print("Image object was deleted.")
        } catch let error as NSError {
            print("Could not delete image object: \(error)")
        }
    }

}
