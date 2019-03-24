//
//  ViewController.swift
//  BullsEye
//
//  Created by Pablo Fernandez Guerra on 24/03/2019.
//  Copyright © 2019 Pablo Fernandez Guerra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showHitMeAlert() {
        let alert = UIAlertController(title: "Hello World!", message: "This is my first App!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func knockKnock() {
        let alert = UIAlertController(title: "Knock knock", message: "Who is there?", preferredStyle: .actionSheet)
        
        let action = UIAlertAction(title: "Its me!", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }


}

