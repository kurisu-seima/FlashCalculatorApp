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
    
    var timerCount = FlashCalculatorManager.shared.numberOfQuestion * FlashCalculatorManager.shared.flashSpeed + FlashCalculatorManager.shared.flashSpeed

    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: Double(FlashCalculatorManager.shared.flashSpeed), target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        timerCount -= FlashCalculatorManager.shared.flashSpeed
        
        if timerCount != 0 {
            let randomInt = Int.random(in: 10...99)
            calculateLabel.text = String(randomInt)
        } else {
            timer.invalidate()
            calculateLabel.text = "終わり"
        }
    }
}


/* switch timerCount {
case let count where count % 2 == 0 && count > 0:
    let randomInt = Int.random(in: 1..<10)
    calculateLabel.text = String(randomInt)
case 0:
    timer.invalidate()
    calculateLabel.text = ""
default:
    calculateLabel.text = ""
 */
