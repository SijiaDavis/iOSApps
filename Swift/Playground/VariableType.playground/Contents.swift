//: Playground - noun: a place where people can play

import UIKit

//************
// Exercise 1.
//************

var a:    Int = 1;
var b:    Int = 2;

var newB: Int = a;

a = b;
b = newB;

//************
// Exercise 2.
//************

var A: Int = 123;

print(abs(A) % 10);

//************
// Exercise 3. 
//************

var x3:  Int = 3;
var y3:  Int = 2;
var bob: Int = 12;

var alice: Int = (bob + x3) * y3 - x3;

//************
// Exercise 4.
//************

var numberOfBoys:   Int = 20;
var numberOfGirls:  Int = 60;

var percentOfBoys:  Int = numberOfBoys * 100 / (numberOfBoys + numberOfGirls);
var percentOfGirls: Int = numberOfGirls * 100 / (numberOfBoys + numberOfGirls);

print("percentage of boys is \(percentOfBoys)%")
print("percentage of girls is \(percentOfGirls)%")

//************
// Exercise 5.
//************

var nu: Double = 3.31 * exp(log(10) * 8) + 2.01 * exp(log(10) * 7);
var de: Double = 7.61 * exp(log(10) * 6) + 2.01 * exp(log(10) * 8);

var result: Double = nu / de;
print(result);

//************
// Exercise 6.
//************

var mealCost:  Double  = 3.5;
var tip:       Int     = 25;


var totalCost: Double = mealCost * (1 + Double(tip) / 100);

// round up for money amount
let numberOfPlaces: Double = 2.0;
let mult: Double = pow(10.0, numberOfPlaces);

totalCost = round(totalCost * mult) / mult;
print(totalCost);

//************
// Exercise 7.
//************

var number: Double = 5.3242;

var roundedNum: Double = round(number * mult)/mult;
print(roundedNum);






