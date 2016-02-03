//
//  PostImageViewController.swift
//  ParseStarterProject
//
//  Created by Sijia Davis on 2/2/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Parse
import UIKit

class PostImageViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    // MARK: - Properties and IBOutlets
    var activityIndicator = UIActivityIndicatorView()
    
    @IBOutlet weak var imageToPost: UIImageView!
    @IBOutlet weak var message: UITextField!
    
    // MARK: - Utility methods
    // function to display alert message
    func displayAlert(title:String, errormessage:String){
        
        let alert = UIAlertController(title: title, message: errormessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            // we want the alert to be dismissed
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    // function to display activity indicator on the page when elements load
    func displayActivityIndicator(){
        
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    // function to stop activity indicator on the page when elements finish loading
    func stopActivityIndicator(){
        self.activityIndicator.stopAnimating()
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }

    // MARK: - IBActions
    @IBAction func postImage(sender: AnyObject) {
        
        // set up activity indicator
        displayActivityIndicator()
        
        // save image information to Parse
        let post = PFObject(className: "Post")
        post["message"] = message.text
        post["userId"] = PFUser.currentUser()?.objectId
        
        // save image to Parse. convert image to data
        let imageData = UIImageJPEGRepresentation(imageToPost.image!, 7)
        let imageFile = PFFile(name: "image.png", data: imageData!)
        
        post["imageFile"] = imageFile
        post.saveInBackgroundWithBlock { (success, error) -> Void in
            
            // stop activity indicator
            self.stopActivityIndicator()
            
            if error == nil {
                
                self.displayAlert("Success", errormessage: "Image successfully posted :)")
                
                // reset the image to default
                self.imageToPost.image = UIImage(named: "photo.png")
                self.message.text = ""
            }
            else {
                
                self.displayAlert("Failed", errormessage: "Please try again later!")
            }
        }
        
        
        
    }
    
    @IBAction func chooseImage(sender: AnyObject) {
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        imageToPost.image = image
    }
    
    // MARK: - Initialisation and memory management
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
