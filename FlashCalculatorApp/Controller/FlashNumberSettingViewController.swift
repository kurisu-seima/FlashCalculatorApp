//
//  FlashNumberSettingViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/06.
//

import UIKit

class FlashNumberSettingViewController: UIViewController {

    @IBOutlet weak var numberPicker: UIPickerView!
    
    var pickerList = [["レベル1", "レベル2", "レベル3", "レベル4", "レベル5", "レベル6", "レベル7", "レベル8", "レベル9", "レベル10"], ["1桁", "2桁", "3桁"], ["1口", "2口", "3口", "4口", "5口", "6口", "7口", "8口", "9口", "10口", "11口", "12口", "13口", "14口", "15口"], ["1秒", "2秒", "3秒"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberPicker.delegate = self
    }
    
    @IBAction func backButtonDidTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension FlashNumberSettingViewController: UIPickerViewDataSource, UIPickerViewAccessibilityDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = pickerList[component][row]
        return item
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0, 1, 2, 3:
            return 100
        default:
            return 100
        }
    }
}
