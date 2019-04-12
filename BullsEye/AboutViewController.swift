//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Pablo Fernandez Guerra on 07/04/2019.
//  Copyright © 2019 Pablo Fernandez Guerra. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAboutWebView()
    }
    
    func loadAboutWebView () {
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func onClickCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
