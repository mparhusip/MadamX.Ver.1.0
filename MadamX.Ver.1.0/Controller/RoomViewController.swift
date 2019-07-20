//
//  RoomViewController.swift
//  MadamX.Ver.1.0
//
//  Created by Indah Fitriany on 16/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class RoomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        roomArray = createRoomArray()
    }
    
    
    var roomArray: [RoomsModel] = []
    
    func createRoomArray() -> [RoomsModel]{
        
        var tempData : [RoomsModel] = []
        
        let data1 = RoomsModel(roomIcon: #imageLiteral(resourceName: "Bathroom-1"), roomLabel: "Bathroom")
        
        let data2 = RoomsModel(roomIcon: #imageLiteral(resourceName: "Bedroom"), roomLabel: "Bedroom")
        
        let data3 = RoomsModel(roomIcon: #imageLiteral(resourceName: "Kitchen"), roomLabel: "Kitchen")
        
        let data4 = RoomsModel(roomIcon: #imageLiteral(resourceName: "Living Room"), roomLabel: "Living Room")
       
        let data5 = RoomsModel(roomIcon: #imageLiteral(resourceName: "Dining Room"), roomLabel: "Dining Room")
        
        tempData.append(data1)
        tempData.append(data2)
        tempData.append(data3)
        tempData.append(data4)
        tempData.append(data5)
        
        return tempData
    }
    

   

}

extension RoomViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roomArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Room", for: indexPath) as! RoomsCollectionViewCell
        
        cell.setCell(data: roomArray[indexPath.row])
        
        return cell
    }
    
    
    
}
