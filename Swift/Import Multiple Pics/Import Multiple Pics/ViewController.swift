//
//  ViewController.swift
//  Import Multiple Pics
//
//  Created by Sijia Davis on 1/21/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//
import UIKit
import BSImagePicker
import Photos

class ViewController: UIViewController{
    
 
    var assets: [PHAsset]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showImagePicker(sender: UIButton) {
        let vc = BSImagePickerViewController()
        vc.maxNumberOfSelections = 6
        
        bs_presentImagePickerController(vc, animated: true,
            select: { (selectedAsset: PHAsset) -> Void in
                print("Selected: \(selectedAsset)")
            }, deselect: { (deselectedAsset: PHAsset) -> Void in
                print("Deselected: \(deselectedAsset)")
            }, cancel: { (canceldAsset: [PHAsset]) -> Void in
                print("Cancel: \(canceldAsset)")
            }, finish: { (finishedAssets: [PHAsset]) -> Void in
                print("Finish: \(finishedAssets)")
                self.assets = finishedAssets
            }, completion: nil)
    }

}
