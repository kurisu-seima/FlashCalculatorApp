//
//  FlashSettingViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/08.
//

import UIKit

class FlashSettingViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!
    @IBOutlet weak var selectAreaHeight: NSLayoutConstraint!

    @IBOutlet weak var digitLabel: UILabel!
    @IBOutlet weak var flashSpeedLabel: UILabel!
    @IBOutlet weak var numberOfQuestionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func settingButtonDidTapped(_ sender: UIButton) {
        customView.buttonTag = sender.tag
        customView.delegate = self
        selectAreaHeight.constant = 200
        customView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func moveTopVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension FlashSettingViewController: CustomViewDelegate {
    func closePicker(selected: String) {
        selectAreaHeight.constant = 0
        customView.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        switch customView.buttonTag {
        case 0:
            digitLabel.text = selected
        case 1:
            flashSpeedLabel.text = selected
        case 2:
            numberOfQuestionLabel.text = selected
        default:
            break
        }
    }
}
