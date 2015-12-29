//: Playground - noun: a place where people can play

import UIKit

//************
// Exercise 1.
//************

var people: [[String : String]] = [
    [ "firstName": "Calvin", "lastName":"Newton"],
    [ "firstName": "Garry",  "lastName":"Mckenzie"],
    [ "firstName": "Sonja",  "lastName":"Moreno"],
    [ "firstName": "Noel",   "lastName":"Bowen"]
];

var firstNames: [String] = [];

for item in people
{
    for (key, value) in item
    {
        if key == "firstName"
        {
            firstNames.append(value);
        }
    }
}

print(firstNames);


//**********
// Frequency
//**********

var numbers: [Int] = [1, 2, 3, 3, 3, 5, 2, 1, 3, 4, 2, 2, 2];

var freq = Dictionary<Int, Int> ();

for num in numbers
{
    if freq[num] == nil
    {
        freq[num] = 1;
    }
    else
    {
        freq[num] = freq[num]! + 1;
    }
}



let sortedDict2 = freq.sort{$0.0 < $1.0}

print(sortedDict2);
