//
//  CheckIn-OutVC.swift
//  In50hrsProject
//
//  Created by Rabeeh KP on 24/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit
import FSCalendar
class CheckIn_OutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: -Outlets
    @IBOutlet weak var CloseDateBtn: UIBarButtonItem!
    @IBOutlet weak var DoneDateBtn: UIBarButtonItem!
    
    
    
    
    //MARK: Actions
    @IBAction func CloseDateBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    @IBAction func DoneDateBtn(_ sender: UIBarButtonItem) {
       
    
    }
    
    @IBOutlet weak var Calender: FSCalendar!
    
    
}
