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
        
        
    }


    
    @IBAction func startGame(_ sender: Any) {
    }
    
    
}

