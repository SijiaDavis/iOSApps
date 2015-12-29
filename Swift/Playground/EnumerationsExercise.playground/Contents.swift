//: Playground - noun: a place where people can play

import UIKit

//************
// Exercise 1
//************

enum Direction: String
{
    case Up;
    case Down;
    case Right;
    case Left;
}

var location: (Int, Int) = (x:0, y:0)

var steps: [Direction] = [ .Up, .Up, .Left, .Down, .Left ]

for step in steps
{
    switch step
    {
    case .Up:
        location.1 = location.1 + 1;
    case .Left:
        location.0 = location.0 - 1;
    case .Down:
        location.1 = location.1 - 1;
    case .Right:
        location.0 = location.0 + 1;
        
    }
}

print("Location is \(location)");


//************
// Exercise 2
//************

enum HandShape: String
{
    case Rock;
    case Paper;
    case Scissors;
}

enum MatchResult: String
{
    case Win;
    case Draw;
    case Lose;
}

func match (firstPlayer: HandShape, secondPlayer: HandShape) -> MatchResult
{
    switch (firstPlayer, secondPlayer)
    {
    case (.Rock, .Rock), (.Paper, .Paper), (.Scissors, .Scissors):
        return .Draw;
    case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
        return .Win;
    default:
        return .Lose;
    }
    
}

print(match(.Rock, secondPlayer: .Paper));
