//
//  CustomView.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/13.
//

import UIKit

protocol CustomViewDelegate {
    func closePicker(selected: String)
}

class CustomView: UIView {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var buttonTag: Int = 0
    
    var digitArray = [Int](1...5)
    var flashSpeedArray = [Int](1...5)
    var numberOfQuestionArray = [Int](1...10)
    
    var delegate: CustomViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibInit()
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    fileprivate func nibInit() {
        guard let view = UINib(nibName: "CustomView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }

    @IBAction func doneButtonDidTapped(_ sender: Any) {
        let pickerNumber = pickerView.selectedRow(inComponent: 0)
        guard let pickerItem = pickerView(pickerView, titleForRow: pickerNumber, forComponent: 0) else {
            return
        }
        self.delegate?.closePicker(selected: pickerItem)
    }
}

extension CustomView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch buttonTag {
        case 0:
            return digitArray.count
        case 1:
            return flashSpeedArray.count
        case 2:
            return numberOfQuestionArray.count
        default:
            return 5
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch buttonTag {
        case 0:
            return String(digitArray[row])
        case 1:
            return String(flashSpeedArray[row])
        case 2:
            return String(numberOfQuestionArray[row])
        default:
            return "項目がありません"
        }
    }
}
