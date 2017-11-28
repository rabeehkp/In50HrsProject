//
//  ViewController.swift
//  In50hrsProject
//
//  Created by Rabeeh KP on 24/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RoomCtrlDelegate {
    
    
    //MARK: -Outlets
    @IBOutlet weak var LblDestination: UILabel!
    @IBOutlet weak var LblCheckOut: UILabel!
    @IBOutlet weak var LblCheckIn: UILabel!
    @IBOutlet weak var ChildBtn: UIButton!
    @IBOutlet weak var AdultsBtn: UIButton!
    @IBOutlet weak var roomsBtn: UIButton!
    @IBOutlet weak var CheckOutBtn: UIButton!
    @IBOutlet weak var CheckInBtn: UIButton!
    @IBOutlet weak var DestinationBtn: UIButton!
    @IBOutlet weak var SearchBtn: UIButton!
    //Animation Outlets
    @IBOutlet weak var newView: UIView!
    @IBOutlet weak var LikeBtn: UIButton!
    @IBOutlet weak var CloseBtn: UIButton!
    @IBOutlet weak var PopUpBtn: UIButton!
    @IBOutlet weak var MsgView: UIView!
    
    //MARK: -Variables
    var uDefault = UserDefaults.standard
    var clicked = Bool()
    var sendingAdltNo = String()
    var sendingChldNo = String()
    var roomsDetails = [RoomDetails]()
    
    
    //MARK: -View Methords
    override func viewDidLoad() {
        super.viewDidLoad()
        newView.layer.cornerRadius = 22
        //PopUpBtn.layer.cornerRadius = 22
        self.CloseBtn.isHidden = true
        self.LikeBtn.isHidden = true
       SearchBtn.layer.cornerRadius = 8
        AdultsBtn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        ChildBtn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        roomsBtn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
    }

    override func viewWillAppear(_ animated: Bool) {
        AdultsBtn.layer.borderColor = UIColor.white.cgColor
    }
    
    //MARK: -Action
    @IBAction func DestinationBtn(_ sender: UIButton) {
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "DestinationVC") as! DestinationVC
        self.present(destination, animated: true, completion: nil)
    }
    
    @IBAction func CheckInDateBtn(_ sender: UIButton) {
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "CheckIn_OutVC") as! CheckIn_OutVC
        self.present(destination, animated: true, completion: nil)
    }
    
    @IBAction func CheckOutDateBtn(_ sender: UIButton) {
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "CheckIn_OutVC") as! CheckIn_OutVC
    
        self.present(destination, animated: true, completion: nil)
    }
    
    @IBAction func NoOfRoomsBtn(_ sender: UIButton) {
        self.callToRoomVC()
    }
    
    @IBAction func NoOfAdltBtn(_ sender: UIButton) {
       self.callToRoomVC()
    }
    
    @IBAction func NoOfChildBtn(_ sender: UIButton) {
        self.callToRoomVC()
    }
    
    @IBAction func SearchBtn(_ sender: UIButton) {
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "LookingHotelsVc") as! LookingHotelsVc
        self.present(destination, animated: true, completion: nil)
    }
    //Animation Button
    @IBAction func PopUpAction(_ sender: UIButton) {
        if newView.transform == .identity{
            UIView.animate(withDuration: 0.8, animations: {
                self.newView.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.MsgView.transform = CGAffineTransform(translationX: 0, y: -421)
                self.PopUpBtn.transform = CGAffineTransform(rotationAngle: self.radians(degrees: 180))
            }) { (true) in
            }
            self.LikeBtn.isHidden = false
            self.CloseBtn.isHidden = false
        }
        else{
            UIView.animate(withDuration: 0.8, animations: {
                self.newView.transform = .identity
                self.MsgView.transform = .identity
                self.PopUpBtn.transform = .identity
            }, completion: { (true) in
                
            })
            self.CloseBtn.isHidden = true
            self.LikeBtn.isHidden = true
        }
    }
    @IBAction func animtnCloseBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.newView.transform = .identity
            self.MsgView.transform = .identity
            self.PopUpBtn.transform = .identity
        }) { (true) in
            
        }
        self.CloseBtn.isHidden = true
        self.LikeBtn.isHidden = true
        LikeBtn.setImage(#imageLiteral(resourceName: "Like"), for: UIControlState.normal)
    }
    
    @IBAction func LikeBtn(_ sender: UIButton) {
        //        if clicked
        //        {
        LikeBtn.setImage(#imageLiteral(resourceName: "RedLike"), for: UIControlState.normal)
        //        }
        //        else{
        //        LikeBtn.setImage(#imageLiteral(resourceName: "Like") , for: UIControlState.normal)
        //        }
        //
    }
    //MARK: -Navigation
    func callToRoomVC(){
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "RoomsVC") as! RoomsVC

        destination.delegate = self
        if sendingAdltNo == ""{
            destination.recieveAdltNo = "1"
        }else{
            destination.recieveAdltNo = sendingAdltNo
        }
        if sendingChldNo == ""{
            destination.recieveChldNo = "0"
        }
        else{
            destination.recieveChldNo = sendingChldNo
        }
        
        self.present(destination, animated: true, completion: nil)
    }
    func radians(degrees: Double) -> CGFloat{
        return CGFloat(degrees * .pi/degrees)
    }
//    
    //MARK: -Delegate
    func selectedDetails(AdultsCount : Int , ChildsCount : Int) {
        print(AdultsCount)
        print(ChildsCount)
        //Adult value print to buttn
        let cnvrtAdlt = String(AdultsCount)
        let cnvrtChld = String(ChildsCount)
    
        if let strngAdlt = cnvrtAdlt as? String{
        let btnAdltLbl = [strngAdlt , "Adults"]
        let joinedAdltString = btnAdltLbl.joined(separator: " ")
        AdultsBtn.setTitle(joinedAdltString, for: UIControlState.normal)
        sendingAdltNo = strngAdlt
        }
        //chld value print to btn
        if let strngChld = cnvrtChld as? String {
        let btnChldLbl = [strngChld , "Child"]
        let joinedChldString = btnChldLbl.joined(separator: " ")
        ChildBtn.setTitle(joinedChldString, for: UIControlState.normal)
        sendingChldNo = strngChld
        }
    }
    
}

