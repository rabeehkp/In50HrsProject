//
//  AddRoomTblVwCell.swift
//  In50hrsProject
//
//  Created by Rabeeh KP on 24/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit

class AddRoomTblVwCell: UITableViewCell {
   var roomDetails = [RoomDetails]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    //MARK: -Outlets
     @IBOutlet weak var AddRoomBtn: UIButton!

}

