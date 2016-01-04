//: Playground - noun: a place where people can play

import UIKit

var stre = "Hello, playground"
var newString = stre + " Arwen"

for var i in newString.characters{
    print(i)
}

var newTypeString = NSString(string:newString)
newTypeString.substringToIndex(4)
newTypeString.substringFromIndex(4)
newTypeString.substringWithRange(NSRange(location: 3, length: 5))
newTypeString.containsString("Arwen")

if newTypeString.containsString("Arwen"){
    // do something here
}

// split stirng into seperate strings
newTypeString.componentsSeparatedByString(" ")

newTypeString.uppercaseString
newTypeString.lowercaseString
newTypeString.rangeOfString("Ar")


var str = "Hola, Rob"
var i = 1
while (i < 8)
{
    print (Array(str.characters)[i])
    i++
}