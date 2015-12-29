//: Playground - noun: a place where people can play

import UIKit

//************
// Exercise 1
//************

var a: Int = 11;
var b: Int = 22;

if a < b
{
    print(b);
}
else
{
    print(a);
}


//************
// Exercise 2
//************

var c: Int = 33;
var d: Int = 8;

if c % d == 0
{
    print("Divisible");
}
else
{
    print("Not Divisible");
}


//***********
// Exercise 3
//***********

var divisor: Int = 3 * 5 * 7;
let number:  Int = 120;

if number % divisor == 0
{
    print("number is divisible by 3, 5, and 7.");
}
else
{
    print("number is not divisible by 3, 5, and 7.");
}


//***********
// Exercise 4
//***********

let nTimes: Int = 3;
for var i = 0; i < nTimes; i++
{
    print("I will not skip the fundamentals!");
}


//************
// Exercise 5
//************

let max2: Int   = 10;
var expo: Int   = 0;
var result: Int = 0;

while result <= max2
{
    result = 2 << expo;
    
    if (result <= max2)
    {
      print(result);
      expo++;
    }
    else
    {
      break;
    }
}

//***********
// Exercise 6
//***********

let maxF: Int = 10;
var fibonacci: [Int] = [1, 1];

var count:      Int  = fibonacci.count;

while (count < maxF)
{
    fibonacci.append(fibonacci[count - 2] + fibonacci[count - 1]);
    count++;
}

print(fibonacci);


