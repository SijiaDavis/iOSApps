//: Playground - noun: a place where people can play

import UIKit

//************
// Exercise 1.
//************

func minmax(firstNum: Int, secondNum: Int) -> (min: Int, max: Int)
{
    if (firstNum < secondNum)
    {
        return (firstNum, secondNum);
    }
    else
    {
        return (secondNum, firstNum);
    }
}

minmax(5, secondNum: 3);
minmax(3, secondNum: 7);
minmax(3, secondNum: 3);


//************
// Exercise 2.
//************

var a: (Int, Int) = (5, 8);
var b: (Int, Int) = (17, 9);

let (nuA, deA) = a;
let (nuB, deB) = b;

var sumOfFraction: (Int, Int) = (nuA * deB + deA * nuB, deA * deB);

