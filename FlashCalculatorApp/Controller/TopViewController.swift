//
//  TopViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/06.
//

import UIKit

class TopViewController: UIViewController {

    @IBOutlet weak var startButton: CustomButton!
    
    @IBOutlet weak var titlelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlelabel.text = "\(FlashCalculatorManager.shared.numberOfDigit)桁 \(FlashCalculatorManager.shared.flashSpeed)秒間隔 \(FlashCalculatorManager.shared.numberOfQuestion)問"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titlelabel.text = "\(FlashCalculatorManager.shared.numberOfDigit)桁 \(FlashCalculatorManager.shared.flashSpeed)秒間隔 \(FlashCalculatorManager.shared.numberOfQuestion)問"
    }
    
    @IBAction func startButtonDidTapped(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "Calculate") as! CalculateViewController
        self.present(nextVC, animated: true, completion: nil)
    }
    @IBAction func levelChangeButtonDidTapped(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "levelChange") as! FlashSettingViewController
        self.present(nextVC, animated: true, completion: nil)
    }
}
