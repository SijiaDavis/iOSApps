//: Playground - noun: a place where people can play

import UIKit

//************
// Exercise 1.
//************

var listOfNumber: [Int] = [1, 2, 3, 10, 100];

var largestNum: Int = listOfNumber[0];

for num in listOfNumber
{
    if largestNum < num
    {
        largestNum = num;
    }
}

print("Largest number is \(largestNum)");


//************
// Exercise 2.
//************

for num in listOfNumber.reverse()
{
    print(num);
}


//************
// Exercise 3.
//************

var nbNum:      Int  = 30;
var fibonacci: [Int] = [1, 1];

var count:      Int  = fibonacci.count;

while (count < nbNum)
{
    fibonacci.append(fibonacci[count - 2] + fibonacci[count - 1]);
    count++;
}

print(fibonacci);

