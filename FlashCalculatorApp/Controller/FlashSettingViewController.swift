//
//  FlashSettingViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/08.
//

import UIKit

class FlashSettingViewController: UIViewController {

    @IBOutlet weak var digitTextView: UITextView!
    @IBOutlet weak var flashSpeedTextView: UITextView!
    @IBOutlet weak var numberOfQuestionTextView: UITextView!
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture()
    }
    
    @IBAction func settingButtonDidTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            digitTextView.keyboardType = .numberPad
            digitTextView.becomeFirstResponder()
        case 1:
            flashSpeedTextView.keyboardType = .numberPad
            flashSpeedTextView.becomeFirstResponder()
        case 2:
            numberOfQuestionTextView.keyboardType = .numberPad
            numberOfQuestionTextView.becomeFirstResponder()
        default:
            break
        }
    }
    
    @IBAction func moveTopVC(_ sender: Any) {
        guard let numberOfDigit = Int(digitTextView.text), let flashSpeed = Int(flashSpeedTextView.text), let numberOfQuestion = Int(numberOfQuestionTextView.text) else {
            return
        }
        
        if (numberOfDigit <= 4) && (flashSpeed <= 10) && (numberOfQuestion <= 100) {
            FlashCalculatorManager.shared.numberOfDigit = numberOfDigit
            FlashCalculatorManager.shared.flashSpeed = flashSpeed
            FlashCalculatorManager.shared.numberOfQuestion = numberOfQuestion
            self.dismiss(animated: true, completion: nil)
        } else {
            warningLabel.text = "設定できる範囲は桁数4, 速度10, 問題数100まで可能です"
        }
    }
    
    func tapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func closeKeyboard() {
        self.view.endEditing(true)
    }
}
