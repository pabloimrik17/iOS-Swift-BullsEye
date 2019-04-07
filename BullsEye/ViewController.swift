//
//  ViewController.swift
//  BullsEye
//
//  Created by Pablo Fernandez Guerra on 24/03/2019.
//  Copyright © 2019 Pablo Fernandez Guerra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    
    let initialValue: Int = 50
    var currentValue: Int = 0
    var targetValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentValueFromSlider()
        startNewRound()
    }
    
    @IBAction func onClickHitMe() {
        hitMeShowAlert()
        startNewRound()
    }
    
    func hitMeShowAlert() {
        let message: String = "The value of the slider is now: \(currentValue)" +
        "\nThe target value was \(targetValue)"
        
        let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        getCurrentValueFromSlider()
    }
    
    func getCurrentValueFromSlider () {
        currentValue = Int(slider.value.rounded())
    }
    
    func initSliderValue() {
        currentValue = initialValue
        slider.value = Float(currentValue)
    }
    
    func initTargetValue() {
        targetValue = Int.random(in: 1...100)
        targetValueLabel.text = String(targetValue)
    }
    
    func startNewRound() {
        initSliderValue()
        initTargetValue()
    }
}

