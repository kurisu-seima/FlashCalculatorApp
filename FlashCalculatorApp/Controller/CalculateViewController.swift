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
    
    var maxNumber: Int {
        return FlashCalculatorManager.shared.maxValue
    }
    
    var minNumber: Int {
        return FlashCalculatorManager.shared.minValue
    }
    
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
            let nextVC = storyboard?.instantiateViewController(withIdentifier: "answerVC") as! AnswerViewController
            nextVC.currectAnswer = gokei
            self.present(nextVC, animated: true, completion: nil)
        } else {
            let digitNumber = Int.random(in: minNumber...maxNumber)
            gokei += digitNumber
            calculateLabel.text = String(digitNumber)
        }
    }
}

