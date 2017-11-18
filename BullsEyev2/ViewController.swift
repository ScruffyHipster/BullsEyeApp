//
//  ViewController.swift
//  BullsEyev2
//
//  Created by Tom Murray on 14/11/2017.
//  Copyright © 2017 Tom Murray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var currentValue = 0
    var sliderPositionRemain: Int = 0
    var targetValue = 0
    var score = 0
    var rounds = 0
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = 50
        startNewRound()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        sliderPositionRemain = currentValue
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(rounds)
    }
    
    @IBAction func startOverbutton() {
        currentValue = 50
        score = 0
        rounds = 0
        startNewRound()
    }
    
//    func alertTitle {
//        if score == 0 {
//            let alert = UIAlertAction(title: "BullsEye!!", message: message, preferredStyle: .alert)
//        } else if score < 10 {
//            let alert = UIAlertAction(title: "So close", message: message, preferredStyle: .alert)
//        }
//    }

    @IBAction func showAlert() {
        var difference: Int
        difference = currentValue - targetValue
        if difference < 0 {
            difference *= -1
        }
        
        var points = 100 - difference
    
        rounds += 1
        
        let title: String
        
        if difference == 0 {
            title = "On point!"
            points += 100
        } else if difference < 5 {
            title = "So close"
            if difference == 1 {
                points += 51
            }
        } else {
            title = "try again Pa"
        }
        
         score += points
        
        let message = "You scored: \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: {action in self.startNewRound()})
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        }
    

    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

}
