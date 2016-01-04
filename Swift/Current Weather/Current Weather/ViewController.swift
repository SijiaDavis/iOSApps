//
//  ViewController.swift
//  Current Weather
//
//  Created by Sijia Davis on 1/4/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    
    @IBAction func getWeather(sender: UIButton) {
        let city = cityTextField.text?.lowercaseString.stringByReplacingOccurrencesOfString(" ", withString: "-")
        if (city != "") {
            let url = NSURL(string:"http://www.weather-forecast.com/locations/"+city!+"/forecasts/latest")
       
            
                    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
                        // will happen when task completes
                        
                        // if data exists
                        if let urlContent = data {
                           let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)// similar to string, but allows encoding
                         
                            let usefulWebContent = webContent?.componentsSeparatedByString(" 1 &ndash; 3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                            
                            if (usefulWebContent!.count>1) {
                            let moreUsefulContent = usefulWebContent![1].componentsSeparatedByString("</span>")
                            
                                if (moreUsefulContent.count>1) {
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                print(moreUsefulContent[0])
                                self.weatherLabel.text = moreUsefulContent[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                    
                                
                            })
                                }
                            }
            
                        } else {
                          
                        }
                    }
                    
                    task.resume()
            
            
        }
        else {
            self.weatherLabel.text = "Please enter a city name"
        }
        

        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

