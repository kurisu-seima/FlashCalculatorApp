//
//  AnswerViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/17.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var anserTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerSetUp()
    }
    
    func answerSetUp() {
        anserTextView.becomeFirstResponder()
        anserTextView.keyboardType = .numberPad
    }
    
    @IBAction func checkAnswerButtonDidTapped(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "CheckAnswerVC") as! CheckAnswerViewController
        self.present(nextVC, animated: true, completion: nil)
    }
}
