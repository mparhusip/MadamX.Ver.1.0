//
//  RoomsCollectionViewCell.swift
//  MadamX.Ver.1.0
//
//  Created by Indah Fitriany on 16/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class RoomsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roomsImageIcon: UIImageView!
    @IBOutlet weak var roomName: UILabel!
    
    func setCell(data : RoomsModel){
        roomsImageIcon.image = data.roomIcon
        roomName.text = data.roomLabel
    }
    
    
    
}
