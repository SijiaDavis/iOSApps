//
//  Temperature.swift
//  TempConverter
//
//  Created by Sijia Davis on 11/23/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

import Foundation

class Temperature
{
    func fahrenheitToCelsius (fahrenheit: Double) -> Double
    {
        return round((fahrenheit - 32) / 1.8);
    }
    
    func celsiusToFahrenheit (celsius: Double) -> Double
    {
        return round(celsius * 1.8 + 32);
    }
}
