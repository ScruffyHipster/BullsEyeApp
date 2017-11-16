//
//  ViewController.swift
//  BullsEyev2
//
//  Created by Tom Murray on 14/11/2017.
//  Copyright © 2017 Tom Murray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var currentValue: Int = 0
    var sliderPositionRemain: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
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
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)"
        +
        "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        startNewRound()
        }

    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
}
