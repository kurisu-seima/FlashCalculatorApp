//CheckAnswerViewController
//  JudgementViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/17.
//

import UIKit

class JudgementViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var judegeLabel: UILabel!
    
    var currectAnswer: Int = 0
    var myAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "\(FlashCalculatorManager.shared.numberOfDigit)桁 \(FlashCalculatorManager.shared.flashSpeed)秒間隔 \(FlashCalculatorManager.shared.numberOfQuestion)問"
        
        self.judge()
    }
    
    @IBAction func moveTopVC(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func judge() {
        if currectAnswer == myAnswer {
            judegeLabel.text = "正解です"
        } else {
            judegeLabel.text = "不正解です"
        }
    }
}
