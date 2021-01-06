//CalculatingViewController
//  CalculateViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/06.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var calculateLabel: UILabel!
    
    var timer = Timer()
    
    var timerCount = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        timerCount -= 1
        
            switch timerCount {
            case let count where count % 2 == 0 && count > 0:
                let randomInt = Int.random(in: 1..<10)
                calculateLabel.text = String(randomInt)
            case 0:
                timer.invalidate()
                calculateLabel.text = ""
            default:
                calculateLabel.text = ""
        }
    }
}
