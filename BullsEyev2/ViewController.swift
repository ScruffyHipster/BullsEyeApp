//
//  ViewController.swift
//  BullsEyev2
//
//  Created by Tom Murray on 14/11/2017.
//  Copyright © 2017 Tom Murray. All rights reserved.
//

import UIKit
import QuartzCore

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
        
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)

        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)

        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)

        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.add(transition, forKey: nil)
    
        
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
