//
//  AnswerViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/17.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var anserTextView: UITextView!
    
    var currectAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerSetUp()
    }
    
    func answerSetUp() {
        anserTextView.becomeFirstResponder()
        anserTextView.keyboardType = .numberPad
    }
    
    @IBAction func judgementButtonDidTapped(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "JudgeVC") as! JudgementViewController
        nextVC.delegate = self
        self.present(nextVC, animated: true, completion: nil)
    }
}

extension AnswerViewController: JudgementViewControllerDelegate {
    func judge(judgeLabel: UILabel) {
        if currectAnswer == Int(anserTextView.text) ?? 0 {
            judgeLabel.text = "正解です"
        } else {
            judgeLabel.text = "不正解です"
        }
    }
}
