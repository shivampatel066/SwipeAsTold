//
//  ViewController.swift
//  SwipeAsTold
//
//  Created by Shivam on 02/04/19.
//  Copyright © 2019 Shivam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var simonLabel: UILabel!
    
    @IBOutlet weak var startGameButton: UIButton!
    
    var timer = Timer()
    var simonTimer = Timer()
    
    var timeInt = 20
    var scoreInt = 0
    var modeInt = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        simonLabel.layer.cornerRadius = 15
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
       
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
       
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        
        
        
        
        
    }


    
    @IBAction func startGame(_ sender: Any) {
        
        if timeInt == 20 {
            
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.simonSays()
            modeInt = 1
            
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.25
        }
        
        if timeInt == 0 {
            
            timeInt = 20
            scoreInt = 0
            
            timeLabel.text = String("Time: \(timeInt)")
            scoreLabel.text = String("Time: \(scoreInt)")
            
            startGameButton.setTitle("Start Game", for: UIControl.State.normal)
            simonLabel.text = "Simon Says"
            
        }
        
        
        
    }
    
    @objc func updateTimer() {
        
        
        timeInt -= 1
        timeLabel.text = String("Time: \(timeInt)")
        
        
        
        if timeInt == 0 {
            timer.invalidate()
            simonTimer.invalidate()
            simonLabel.text = "Game Over"
            modeInt = 0
            startGameButton.isEnabled = true
            startGameButton.alpha = 1
            
            startGameButton.setTitle("Restart", for: UIControl.State.normal)
            
            
            
            
            
            
        }
        
        
    
    
    
    }
    
    @objc func simonSays() {
        
        let array = ["Simon Says Swipe Right",
                     "Simon Says Swipe Left",
                     "Simon Says Swipe Up",
                     "Simon Says Swipe Down",
                     "Swipe Right",
                     "Swipe Left",
                     "Swipe Up",
                     "Swipe Down"]
        
        let randomWord = Int(arc4random_uniform(UInt32(array.count)))
        simonLabel.text = array[randomWord]
        
        simonTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(simonSays), userInfo: nil, repeats: false)
    }
   
    
    
    
    @objc func swipeGesture(sender: UISwipeGestureRecognizer) {
        
        if modeInt == 1 {
            
            if sender.direction == UISwipeGestureRecognizer.Direction.right {
                
                simonTimer.invalidate()
                
                if simonLabel.text == "Simon Says Swipe Right" || simonLabel.text == "Swipe Right" {
                    
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    self.simonSays()
                    
                } else {
                    
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    self.simonSays()
                    
                }
            }
                
                
            if sender.direction == UISwipeGestureRecognizer.Direction.left {
                    
                    simonTimer.invalidate()
                    
                if simonLabel.text == "Simon Says Swipe Left" || simonLabel.text == "Swipe Left" {
                        
                        scoreInt += 1
                        scoreLabel.text = "Score: \(scoreInt)"
                        self.simonSays()
                        
                } else {
                        
                        scoreInt -= 1
                        scoreLabel.text = "Score: \(scoreInt)"
                        self.simonSays()
                        
                }
            }

                    
            if sender.direction == UISwipeGestureRecognizer.Direction.up {
                        
                        simonTimer.invalidate()
                        
                        if simonLabel.text == "Simon Says Swipe Up" || simonLabel.text == "Swipe Up" {
                            
                            scoreInt += 1
                            scoreLabel.text = "Score: \(scoreInt)"
                            self.simonSays()
                            
                        } else {
                            
                            scoreInt -= 1
                            scoreLabel.text = "Score: \(scoreInt)"
                            self.simonSays()
                            
                        }
                }

                        
            if sender.direction == UISwipeGestureRecognizer.Direction.down {
                            
                            simonTimer.invalidate()
                            
                            if simonLabel.text == "Simon Says Swipe Down" || simonLabel.text == "Swipe Down" {
                                
                                scoreInt += 1
                                scoreLabel.text = "Score: \(scoreInt)"
                                self.simonSays()
                                
                            } else {
                                
                                scoreInt -= 1
                                scoreLabel.text = "Score: \(scoreInt)"
                                self.simonSays()
                                
                            }
                }
            
            
            
        }

                            
    }
}
