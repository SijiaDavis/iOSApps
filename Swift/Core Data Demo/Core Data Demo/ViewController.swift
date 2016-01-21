//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Sijia Davis on 1/20/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Use app delegate to connect to core data
        // The default delegate is UIApplication.sharedApplication().delegate
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
//        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
//        newUser.setValue("Kate", forKey: "username")
//        newUser.setValue("ijd", forKey: "password")
//        // save new user to the database
//        do{
//           try context.save()
//        } catch {
//            // handle error
//            print(error)
//        }
        
        // create request to get data from the core datas
        let request = NSFetchRequest(entityName: "Users")
        // search the data base with name = Peter
        //request.predicate = NSPredicate(format: "username = %@", "Peter")
        request.returnsObjectsAsFaults = false
        do {
           let results = try context.executeFetchRequest(request)
                       if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    context.deleteObject(result)
                    do{
                                   try context.save()
                                } catch {
                                    // handle error
                                    print(error)
                                }
                    //result.setValue("Mimi",forKey:"username")
                    if let username = result.valueForKey("username") as? String{
                        print(username)
                    }
                }
            }
     
        } catch{
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

