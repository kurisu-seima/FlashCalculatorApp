//CheckAnswerViewController
//  JudgementViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/17.
//

import UIKit

protocol JudgementViewControllerDelegate {
    func judge(judgeLabel: UILabel)
}

class JudgementViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var judegeLabel: UILabel!
    
    var delegate: JudgementViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "\(FlashCalculatorManager.shared.numberOfDigit)桁 \(FlashCalculatorManager.shared.flashSpeed)秒間隔 \(FlashCalculatorManager.shared.numberOfQuestion)問"
        
        self.delegate?.judge(judgeLabel: judegeLabel)
    }
    
    @IBAction func moveTopVC(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
