//
//  RoomsVC.swift
//  In50hrsProject
//
//  Created by Rabeeh KP on 24/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit
protocol RoomCtrlDelegate {
    func selectedDetails(AdultsCount : Int , ChildsCount : Int)
}
class RoomsVC: UIViewController, UITableViewDataSource,UITableViewDelegate {
    var delegate : RoomCtrlDelegate?
    //MARK: -Outlets
    @IBOutlet weak var DoneRoomsBtn: UIBarButtonItem!
    @IBOutlet weak var CloseRoomsBtn: UIBarButtonItem!
    @IBOutlet weak var RoomTblVw: UITableView!
    //MARK: -Variables
    var roomDetails = [RoomDetails]()
    var uDefault = UserDefaults.standard
    var adltLbl = Int()
    var chldLbl = Int()
    var convertedAdlt = String()
    var convertedChld = String()
    var sec : Int = 2
    var array : [Int] = [1]
    var recieveAdltNo = String()
    var recieveChldNo = String()
    var iPath = IndexPath()
    //MARK: -ViewMethord
    override func viewDidLoad() {
        super.viewDidLoad()
        convertedAdlt = recieveAdltNo
        convertedChld = recieveChldNo
    
    }
    
    //MARK: -Table DataSource
    func  numberOfSections(in tableView: UITableView) -> Int {
        //return roomDetails.count + 1
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return roomDetails.count
        if section == 0{
            return array.count
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            //roomDetails.count{
            let cell1 = RoomTblVw.dequeueReusableCell(withIdentifier: "AddRooms", for: indexPath)as! AddRoomTblVwCell
            cell1.AddRoomBtn.addTarget(self, action: #selector(RoomsVC.AddRooms(_sender:)), for: UIControlEvents.touchUpInside)
            return cell1
        }
        else{
            let cell = RoomTblVw.dequeueReusableCell(withIdentifier: "Rooms", for: indexPath) as! RoomsTblVwCell
            cell.ChildCountLbl.text = convertedChld
            cell.AdltCountLbl.text = convertedAdlt
            let roomNum = String (array.count)
            let show = ["Room", roomNum]
            let joinedString = show.joined(separator: " ")
            cell.RoomHeaderLbl.text = joinedString
            cell.CloseRoom.addTarget(self, action: #selector(RoomsVC.CloseRoom(_sender:)), for: UIControlEvents.touchUpInside)
            cell.CloseRoom.tag = indexPath.row
            return cell
        }
    }
    //MARK: -Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        if indexPath.section == 0{
            height = 142
        }
        else{
            height = 40
        }
        return  height
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        let roomNum = String(describing: array )
//        let show = ["Room", roomNum]
//        let joinedString = show.joined(separator: " ")
//        return joinedString
//    }
    
    //MARK: -Action
    @IBAction func AddRooms(_sender: UIButton){
       self.array.append(1)
        RoomTblVw.reloadData()
    }
    @IBAction func CloseRoom(_sender: UIButton){
      array.remove(at: _sender.tag)
    self.RoomTblVw.reloadData()
    }
   
    @IBAction func CloseRoomsBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func DoneRoomsBtn(_ sender: UIBarButtonItem) {
        if let adltStore = uDefault.object(forKey: "adlts") as? String{
            adltLbl = Int(adltStore)!
        }
        
        if let chldStr = uDefault.object(forKey: "Child") as? String {
            chldLbl = Int(chldStr)!
        }
        delegate?.selectedDetails(AdultsCount: adltLbl, ChildsCount: chldLbl)
         dismiss(animated: false, completion: nil)
    }
}

