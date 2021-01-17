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
    
    var timerCount = FlashCalculatorManager.shared.numberOfQuestion + 1
    
    var gokei: Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: Double(FlashCalculatorManager.shared.flashSpeed), target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        timerCount -= 1
        
        if timerCount == 0 {
            timer.invalidate()
            calculateLabel.text = "終わり"
        } else {
            var digitNumber = String(Int.random(in: 1...9))
            for count in 1...FlashCalculatorManager.shared.numberOfDigit {
                if count == 1 {
                    gokei += Int(digitNumber)!
                    calculateLabel.text = String(digitNumber)
                } else {
                    digitNumber += String(Int.random(in: 0...9))
                    gokei += Int(digitNumber)!
                    calculateLabel.text = String(digitNumber)
                }
            }
        }
    }
}
