//: Playground - noun: a place where people can play

import UIKit

//************
// Exercise 1.
//************

var a: Int = 2;
var b: Int = 5;

var formattedSum: String = "\(a) + \(b) = \(a + b)";


//************
// Exercise 2.
//************

var aString: String = "Replace the letter e with *";
var replacedString: String = aString.stringByReplacingOccurrencesOfString("e", withString: "*");


//************
// Exercise 3.
//************

var theString: String = "find the longest word in the problem description";

func findLongestWord (sentence: String) ->String
{
    let strArr:[String] = sentence.componentsSeparatedByString(" ");
    var lengthOfWord: Int    = 0;
    var longestWord:  String = "";
    
    for word in strArr
    {
        if lengthOfWord < word.characters.count
        {
            lengthOfWord = word.characters.count;
            longestWord  = word;
        }
    }
    return longestWord;
}

print(findLongestWord(theString))

