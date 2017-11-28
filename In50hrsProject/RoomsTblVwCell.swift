//
//  RoomsTblVwCell.swift
//  In50hrsProject
//
//  Created by Rabeeh KP on 24/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit

class RoomsTblVwCell: UITableViewCell {
    
    
    
    //MARK: -Outlets
    
    //Adults
    @IBOutlet weak var AdltMinBtn: UIButton!
    @IBOutlet weak var AdltPlsBtn: UIButton!
    @IBOutlet weak var AdltCountLbl: UILabel!
    //Children
    
    @IBOutlet weak var ChildCountLbl: UILabel!
    @IBOutlet weak var ChildPlsBtn: UIButton!
    @IBOutlet weak var ChildMinBtn: UIButton!
    //common
    @IBOutlet weak var RoomHeaderLbl: UILabel!
    
    @IBOutlet weak var CloseRoom: UIButton!
    //    @IBOutlet weak var AddRoomBtn: UIButton!
    
    //MARK: -Variables
    var storeAdlt = String()
    var storeChld = String()
    var uDefualt = UserDefaults.standard
    var IntStoreAdlt = Int()
    let IntStoreChild = Int()
    //MARK: -Action
    @IBAction func AdltPlsBtn(_ sender: UIButton) {
        var newvalue = 1
        newvalue = Int(AdltCountLbl.text!)!
        if newvalue >= 0 , newvalue < 6{
            self.AdltCountLbl.text = String(newvalue + 1)
            storeAdlt = AdltCountLbl.text!
            uDefualt.set(storeAdlt, forKey: "adlts")
        }
        
    }
    
    @IBAction func AdltMinBtn(_ sender: UIButton) {
        var newvalue = 0
        newvalue = Int(AdltCountLbl.text!)!
        if newvalue > 1 , newvalue <= 6{
            self.AdltCountLbl.text = String(newvalue - 1)
              storeAdlt = AdltCountLbl.text!
            uDefualt.set(storeAdlt, forKey: "adlts")
            
        }
    }
    
    @IBAction func ChldMinBtn(_ sender: UIButton) {
        var newValue = 0
        newValue = Int(ChildCountLbl.text!)!
        if newValue > 1 , newValue <= 6{
            self.ChildCountLbl.text = String(newValue - 1)
            storeChld = ChildCountLbl.text!
            uDefualt.set(storeChld, forKey: "Child")
            
        }
    }
    
    @IBAction func ChldPlsBtn(_ sender: UIButton) {
        var newValue = 0
        newValue = Int(ChildCountLbl.text!)!
        if newValue >= 0 , newValue < 6{
            self.ChildCountLbl.text = String(newValue + 1 )
            storeChld = ChildCountLbl.text!
            uDefualt.set(storeChld, forKey: "Child")
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
