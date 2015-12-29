//
//  main.swift
//  TempConverter
//
//  Created by Sijia Davis on 11/23/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

import Foundation

// Get user input.
func input() -> String
{
    let keyboard  = NSFileHandle.fileHandleWithStandardInput();
    let inputData = keyboard.availableData;
    var userInput:String = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String;
    userInput.removeAtIndex(userInput.endIndex.predecessor());
   
    return userInput;
}

var unit:       Int?    = 0;
var temp:       Double? = 0;
var ifContinue: Int?    = 1;

var temperature = Temperature();

repeat
{
    // Ask for unit input.
    print("Please enter unit : 0 (degree Celsius) / 1 (Fahrenheit)");
    unit = Int(input());
    
    // User choose to enter temperature in Celsius.
    if unit == 0
    {
        print("Please enter temperature in Degree Celsius:");
        temp = Double(input());
       
        print("\(temp!) Degree Celsius correspond to \(temperature.celsiusToFahrenheit((temp)!)) Fahrenheit");
        
        print("Do you have another value to convert : 1 (oui) / 0 (non)");
        ifContinue = Int(input())!;
    }

    // User choose to enter temperature in Fahrenheit.
    else if unit == 1
    {
        print("Please enter temperature in Fahrenheit:");
        temp = Double(input());
       
        print("\(temp!) Fahrenheit correspond to \(temperature.fahrenheitToCelsius(temp!)) Degree Celsius");
        
        print("Do you have another value to convert : 1 (oui) / 0 (non)");
        ifContinue = Int(input())!;
    
    }

    // User type in something other than 0 or 1.
    else
    {
        print("Invalid input, try again");
        continue;
    }
}
while ifContinue == 1;