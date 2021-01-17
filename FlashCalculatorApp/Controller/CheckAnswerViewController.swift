//
//  CheckAnswerViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/17.
//

import UIKit

class CheckAnswerViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "\(FlashCalculatorManager.shared.numberOfDigit)桁 \(FlashCalculatorManager.shared.flashSpeed)秒間隔 \(FlashCalculatorManager.shared.numberOfQuestion)問"
    }
}
