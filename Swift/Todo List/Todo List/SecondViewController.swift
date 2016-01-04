//
//  SecondViewController.swift
//  Todo List
//
//  Created by Sijia Davis on 1/3/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var itemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.itemTextField.delegate = self
    }

    @IBAction func addNewItem(sender: AnyObject) {
        toDoList.append(itemTextField.text!)
        
        // update NSUserDefault
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
        itemTextField.text = ""
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // user hits enter -> dismiss keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // user taps outside of the keyboard -> dismiss keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}

