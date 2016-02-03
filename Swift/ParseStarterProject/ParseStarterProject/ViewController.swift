//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    // MARK: - Outlets and global variables
    // variable to determine if it is signup mode or login mode
    var signupActive = true;
    
    // Outlets
    @IBOutlet weak var username:       UITextField!
    @IBOutlet weak var password:       UITextField!
    
    @IBOutlet weak var signUpBtn:      UIButton!
    @IBOutlet weak var loginBtn:       UIButton!
    @IBOutlet weak var instructionLbl: UILabel!
    
    // spinner when loading
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    // MARK: - IBActions
    @IBAction func signup(sender: AnyObject) {
        
        if username.text == "" || password.text == "" {
            
            displayAlert("Form error", errormessage: "You need to enter a valid username and password!")
            
        } else {
            
            // Get the activity indicator running while signing up
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0,0,50,50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            // create generic error message
            var errorMessage = "Please try again!"
            
            // Check if signupActive mode is true
            // if signupActive mode is true...
            if signupActive {
            
            // Create parse user
            let user = PFUser()
            user.username = username.text
            user.password = password.text
            
            user.signUpInBackgroundWithBlock({ (succeeded, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if error == nil {
                    // sign up succesfuly
                    print("Sign up successfully")
                    self.performSegueWithIdentifier("login", sender: self)
                    
                } else {
                    if let errorString = error!.userInfo["error"] as? String {
                        errorMessage = errorString
                        self.displayAlert("Signup error", errormessage:errorMessage)
                    }
                }
            
            })
            
            } else {
                // if login mode is active
                PFUser.logInWithUsernameInBackground(username.text!, password: password.text!, block: { (user, error) -> Void in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()

                    if user != nil {
                        // logged in!
                         print("Log in successfully")
                         self.performSegueWithIdentifier("login", sender: self)
                    }
                    else {
                        if let errorString = error!.userInfo["error"] as? String {
                            errorMessage = errorString
                            self.displayAlert("Login error", errormessage:errorMessage)
                        }

                    }
                })
                
            }
        }
       
    }
    
    @IBAction func login(sender: AnyObject) {
        
        if signupActive {
            
            signUpBtn.setTitle("Log in", forState: .Normal)
            instructionLbl.text = "Not regiestered?"
            loginBtn.setTitle("Sign up", forState: .Normal)
            signupActive = false
            
        } else {
            
            signUpBtn.setTitle("Sign up", forState: .Normal)
            instructionLbl.text = "Already regiestered?"
            loginBtn.setTitle("Login", forState: .Normal)
            signupActive = true
            
        }
    }
    
    //MARK: - Initialisation and memory management
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
            self.performSegueWithIdentifier("login", sender: self)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // function to display alert message
    func displayAlert(title:String, errormessage:String){
        
        let alert = UIAlertController(title: title, message: errormessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            // we want the alert to be dismissed
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
}

