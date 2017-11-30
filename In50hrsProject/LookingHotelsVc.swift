//
//  LookingHotelsVc.swift
//  In50hrsProject
//
//  Created by Rabeeh KP on 24/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit

class LookingHotelsVc: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, CustomLayOutDelegate {
    
    
    
    
    //MARK: -Variables
    var imageHight: CGFloat = 0.0
    var hotelName = ["Hotel1","Hotel2","Hotel3","Hotel4","Hotel5","Hotel6","Hotel7","Hotel8","Hotel9","Hotel10","Chennai"]
    
    var photos = [#imageLiteral(resourceName: "Hotel1"),#imageLiteral(resourceName: "Hotel2"),#imageLiteral(resourceName: "Hotel3"),#imageLiteral(resourceName: "Hotel4"),#imageLiteral(resourceName: "Hotel5"),#imageLiteral(resourceName: "Hotel6"),#imageLiteral(resourceName: "Hotel7"),#imageLiteral(resourceName: "Hotel8"),#imageLiteral(resourceName: "Hotel9"),#imageLiteral(resourceName: "Hotel10"),#imageLiteral(resourceName: "Chennai")]
    //MARK: -ViewMethords
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layOut = HotelCollectionView?.collectionViewLayout as? CustomLayOutCVL
        {
        layOut.delegate = self
        }
        //UICollectionViewScrollDirection.vertical.self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: -Outlets
     @IBOutlet weak var CloseBookingBtn: UIBarButtonItem!
    
    @IBOutlet weak var HotelCollectionView: UICollectionView!
    
    //MARK: -CollectionViewDelegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HotelCollectionView.dequeueReusableCell(withReuseIdentifier: "Hotel_Images", for: indexPath) as? CustomImageCollectionCell
        cell?.CustomImgCell.image = UIImage(named:hotelName[indexPath.row])
        cell?.CustomImgCell.contentMode = .scaleAspectFill
//        cell?.layer.cornerRadius = 22
//        cell?.layer.borderWidth = 3
//        cell?.layer.borderColor = UIColor.magenta.cgColor
       return cell!
    }
    
    //Mark: -CustmDelegate
    func collectionView(_ collectionView: UICollectionView, widthForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        //let random = arc4random_uniform(4)
        //return CGFloat(70)
        return photos[indexPath.item].size.width
    }
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        //let random = arc4random_uniform(4)
       return CGFloat(80)
        //return photos[indexPath.item].size.height
    }
    
    
    //MARK: -Action
    
    @IBAction func CloseBookingBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }

}




