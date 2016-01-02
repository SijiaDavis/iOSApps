//
//  ViewController.swift
//  Animal Age
//
//  Created by Sijia Davis on 1/1/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.


import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userAge: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var dogAgeLabel: UILabel!
    @IBOutlet weak var catAgeLabel: UILabel!
    
    @IBOutlet weak var dogAgeResult: UILabel!
    @IBOutlet weak var catAgeResult: UILabel!
    
    var age = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userAge.delegate = self
       
    }
    
    override func viewWillAppear(animated: Bool) {
        submitButton.enabled = false
        dogAgeLabel.hidden = true
        catAgeLabel.hidden = true
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
       
        submitButton.enabled = true

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func submitUserAge(sender: UIButton) {
        if (userAge.text != ""){
        age = Int(userAge.text!)!
        }
        else {
            age = 0
        }
        let dogAge = age/7
        let catAge = age/6
        
        dogAgeLabel.hidden = false
        catAgeLabel.hidden = false
        
        catAgeResult.text = " \(catAge)"
        //catAgeResult.text = String(catAge)
        dogAgeResult.text = String(dogAge)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

