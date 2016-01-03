//: Playground - noun: a place where people can play

import UIKit
import Foundation
//: strings
var str = "Hello, playground"

var name: String = "Sijia Davis"
print("hello \(name)")
print("hello " + name)

// integers, double, float
var int:Int = 3
var d:Double = 0.4
var f:Float = 3.4

int*int
int/4
print("the value of int is \(int)")
print(Double(int)*d)

var k:Bool = true
var isBool:Bool = false

var int1: Int = 2
var d2 :Double = 5.4
var result:String = String(Double(int1)*d2)
print("The result is: "+result)

// Arrays

var array = [2, 5,3, 3]

print(array[2])
print(array[0])
print(array.count)

array.append(3)
array.removeLast()
array.removeAtIndex(0)
array.sort()


var arr = [4, 5, 7]
arr.removeAtIndex(1)
arr.append(arr[0]*arr[1])

// Dictionary
var dic = ["computer":"something nice", "coffee": "something Im addicted to"]
print(dic["computer"]!)
print(dic.count)
dic["something else"]="ok"
dic.removeValueForKey("coffee")
print(dic)

var menu = ["hamberger": 3.5, "fries":4.4, "water": 5.6]
print("total cost of your meal is: \(menu["hamberger"]!+menu["fries"]!+menu["water"]!)")

// If statement
var age = 44
if (age > 18) {
    print("you are old enough!")
    
}
else {
    print("no you are not old enough!")
}

var myName = "Sijia"
if (myName == "Sijia" && !(age > 18)){
    print("hello \(myName)")
    
}
else {
    print("hi new person!")
}

var isB = true
if (isB){
    print("hello!!!!!")
}

var userName = "Sijia"
var password = 123455

if (userName == "Sijia" && password == 1234){
    print("Welcome!")
}
else if (userName != "Sijia"){
    print("ur userName is wrong!")
    
}
else{
    print("your password is wrong!")
}

var randomNum = arc4random_uniform(6)

for var i = 0; i<20;i++ {
    print(i)
}

var ar:[Float] = [1,2,3,4,5,6,7]
for (index, value) in ar.enumerate() {
    ar[index] = value/2.0
}

print(ar)

var n = 1


while (n<11){
    print(n*5)
    n++
}

var a = [1, 3, 4, 5, 6]

var i = 0
while i<a.count {
    print(a[i])
    i++
}

var anotherArray = [1,2,3,4,5,6,7]
var b = 0
while b<anotherArray.count{
    anotherArray[b]--
    b++
}
print(anotherArray)

var num = 23
var isPrime = true
var start = 2

if (num == 1){
    isPrime = false
}

if (num != 1 && num != 2) {

    while start<num {
        if (num%start==0){
            isPrime = false
        }
        start++
    }
}
if (isPrime){
    print("\(num) is a prime number")
}
else {
    print("\(num) is not a prime number")
}

