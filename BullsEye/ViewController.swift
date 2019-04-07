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
    @IBOutlet weak var scoreValueLabel: UILabel!
    @IBOutlet weak var roundValueLabel: UILabel!
    
    enum TitlesEnum: String {
        case Perfect = "Perfect!"
        case Almost = "You almost had it!"
        case Pretty = "Pretty good!"
        case NotClose = "Not even close..."
    }
    
    let initialValue: Int = 50
    let intialPoints: Int = 100
    let initialScore: Int = 0
    let initialRound: Int = 0
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var currentRound: Int = 0
    var difference: Int = 0

    override func viewDidLoad() -> Void {
        super.viewDidLoad()
        getCurrentValueFromSlider()
        initScore()
        initRound()
        startNewRound()
    }
    
    @IBAction func onClickHitMe() -> Void {
        setScore()
        hitMeShowAlert()
        startNewRound()
    }
    
    func hitMeShowAlert() -> Void {
        let title: String = getAlertTitlte()
        
        let message: String = "The value of the slider is now: \(currentValue)" +
        "\nThe target value was \(targetValue)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func getAlertTitlte () -> String {
        var title: String = "";
        
        if difference == 0 {
            title = TitlesEnum.Perfect.rawValue
        } else if difference < 5 {
            title = TitlesEnum.Almost.rawValue
        } else if difference < 10 {
            title = TitlesEnum.Pretty.rawValue
        } else {
            title = TitlesEnum.NotClose.rawValue
        }
        
        return title
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) -> Void {
        getCurrentValueFromSlider()
    }
    
    func getCurrentValueFromSlider () -> Void {
        currentValue = Int(slider.value.rounded())
    }
    
    func initSliderValue() -> Void {
        currentValue = initialValue
        slider.value = Float(currentValue)
    }
    
    func initTargetValue() -> Void {
        targetValue = Int.random(in: 1...100)
        targetValueLabel.text = String(targetValue)
    }
    
    func startNewRound() -> Void {
        initSliderValue()
        initTargetValue()
        incrementRound()
    }
    
    func initScore() {
        score = initialScore
        refreshScoreLabel()
    }
    
    func setScore() -> Void {
        difference = abs(currentValue - targetValue)
        score += calculateUserPoints(difference)
        refreshScoreLabel()
    }
    
    func refreshScoreLabel() -> Void {
        scoreValueLabel.text = String(score)
    }
    
    func calculateUserPoints(_ difference: Int) -> Int {
        let points = intialPoints - difference
        return points
    }
    
    func initRound() {
        currentRound = initialRound
        refreshRoundLabel()
    }
    
    func incrementRound() {
        currentRound += 1
        refreshRoundLabel()
    }
    
    func refreshRoundLabel() {
        roundValueLabel.text = String(currentRound)
    }
}

