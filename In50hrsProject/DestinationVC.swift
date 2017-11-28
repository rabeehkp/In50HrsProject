//
//  DestinationVC.swift
//  In50hrsProject
//
//  Created by Rabeeh KP on 25/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit

class DestinationVC: UIViewController,RoomCtrlDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -Outlets
    @IBOutlet weak var DestCancel: UIBarButtonItem!
    
    @IBOutlet weak var DestDone: UIBarButtonItem!
    
    //MARK: -Action
    @IBAction func DestDone(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    @IBAction func DestCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
        
    }
    func selectedDetails(AdultsCount : Int , ChildsCount : Int) {
         
    }
    
    
}
