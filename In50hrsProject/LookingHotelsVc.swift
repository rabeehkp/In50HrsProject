//
//  LookingHotelsVc.swift
//  In50hrsProject
//
//  Created by Rabeeh KP on 24/11/17.
//  Copyright © 2017 Rabeeh KP. All rights reserved.
//

import UIKit

class LookingHotelsVc: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, CollectionLayoutDelegate {
    
    
    //MARK: -Variables
    var imageHight: CGFloat = 0.0
    var HotelName = ["Hotel1","Hotel2","Hotel3","Hotel4","Hotel5","Hotel6","Hotel7","Hotel8","Hotel9","Hotel10"]
    var hotelSpecificationImages = [UIImage(named:"Hotel1")]
    //,UIImage(named:"Hotel2"),UIImage(named:"Hotel3"),UIImage(named:"Hotel4"),UIImage(named:"Hotel5"),UIImage(named:"Hotel6"),UIImage(named:"Hotel7"),UIImage(named:"Hotel8"),UIImage(named:"Hotel9"),UIImage(named:"Hotel10")
    
    //MARK: -ViewMethords
    override func viewDidLoad() {
        super.viewDidLoad()
         let layout = HotelCollectionView?.collectionViewLayout as? CollectionLayoutDelegate
        
        
        
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
        return hotelSpecificationImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HotelCollectionView.dequeueReusableCell(withReuseIdentifier: "Hotel_Images", for: indexPath) as? CustomImageCollectionCell
        cell?.CustomImgCell.image = hotelSpecificationImages[indexPath.row]
        let height = cell?.CustomImgCell.image?.size.height
        imageHight = height!
        return cell!
    }
    
    //CustomLayOut
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return imageHight
    }
    
    //
    
    
    //MARK: -Action
    
    @IBAction func CloseBookingBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }

}



