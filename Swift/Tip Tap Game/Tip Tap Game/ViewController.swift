//
//  ViewController.swift
//  Tip Tap Game
//
//  Created by Sijia Davis on 1/5/16.
//  Copyright © 2016 SijiaDavis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // 1 = circle, 2 = cross
    
    // keep track of each of the nice squares and see if they are pressed
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    // the winning combinations (tags)
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var gameActive = true
    
  
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    @IBAction func playAgainPressed(sender: UIButton) {
        gameState = [0,0,0,0,0,0,0,0,0]
        activePlayer = 1
        gameActive = true
        label.hidden = true
        label.center = CGPointMake(label.center.x-500, label.center.y)
        
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x-500, playAgainButton.center.y)
        
        // hide all images in the buttons
        var buttonToClear : UIButton
        for (var i = 0; i < 9; i++){
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setBackgroundImage(nil, forState: UIControlState.Normal)
        }
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        // get the state of the button using the button's tag
       
        if (gameState[sender.tag]==0 && gameActive) {
            gameState[sender.tag] = activePlayer
            
        if (activePlayer == 1) {
           sender.setBackgroundImage(UIImage(named: "circle.png")!, forState: UIControlState.Normal)
           activePlayer = 2
            
        }
        
        else {
       
        sender.setBackgroundImage(UIImage(named: "cross.png")!, forState: UIControlState.Normal)
           
            activePlayer = 1
        }
            // loop through combinations of winning and see if the play won
            for combo in winningCombinations{
                
                if (gameState[combo[0]] != 0 && gameState[combo[0]]==gameState[combo[1]] && gameState[combo[1]]==gameState[combo[2]]) {
              
                    gameActive = false
                    if (gameState[combo[0]] == 1){
                        label.text="Circle has won!"
                    }
                    else{
                        label.text="Cross has won!"
                    }
                    label.hidden = false
                    playAgainButton.hidden = false
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.label.center = CGPointMake(self.label.center.x+500
                    , self.label.center.y)
                    })
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x+500
                            , self.playAgainButton.center.y)
                    })
                }
                
            }
            
            if gameActive {
                 var isFinished = true
                for i in gameState {
                    if i == 0 {
                        isFinished = false
                    }
                    
                }
                if isFinished {
                    gameActive = false
                    label.text="It is a tie!"
                    label.hidden = false
                    playAgainButton.hidden = false
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.label.center = CGPointMake(self.label.center.x+500
                            , self.label.center.y)
                    })
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x+500
                            , self.playAgainButton.center.y)
                    })
                    
                    
                }
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }
    override func viewWillAppear(animated: Bool) {
        label.hidden = true
        label.center = CGPointMake(label.center.x-500, label.center.y)
        
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x-500, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

