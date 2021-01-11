//
//  FlashSettingViewController.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/08.
//

import UIKit

class FlashSettingViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var pickerView = UIPickerView()
    var toolbar = UIToolbar()
    var selectArea = UIView()

    var digit = [Int](1...5)
    var flashSpeed = [Int](1...5)
    var numberOfQuestion = [Int](1...10)
    
    var pickerIndexPath: IndexPath = [0, 0]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.pickerSetUp()
    }
    
    @IBAction func saveButtonDidTapped(_ sender: Any) {
    }
    
    func pickerSetUp() {
        //ピッカービューの設定
        pickerView.frame = CGRect(x: 0, y: self.view.frame.height / 2, width: self.view.frame.width, height: self.view.frame.height / 2)
        //サブビューの設定
        selectArea.frame = pickerView.frame
        selectArea.backgroundColor = UIColor.gray
        //ツールバーの設定
        toolbar.frame = CGRect(x: 0, y: self.view.frame.height / 2, width: view.frame.size.width, height: 40)
        let toolbarLabel = UILabel()
        let toolbarTitleList = ["桁数を選択してください", "速度を選択してください", "問題数を選択してください"]
        toolbarLabel.text = toolbarTitleList[pickerIndexPath.row]
        toolbarLabel.textAlignment = .center
        let toolbarTitle = UIBarButtonItem(customView: toolbarLabel)
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(done))
        doneItem.tintColor = .systemBlue
        toolbar.setItems([toolbarTitle, spaceItem, doneItem], animated: true)
        
        //追加
        self.view.addSubview(selectArea)
        selectArea.addSubview(pickerView)
        selectArea.addSubview(toolbar)
        selectArea.isHidden = true
    }
    
    func openPicker() {
        selectArea.isHidden = false
    }
    
    @objc func done() {
        selectArea.isHidden = true
    }
}

//テーブルビュー
extension FlashSettingViewController: UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.setUp(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pickerIndexPath = indexPath
        self.openPicker()
    }
}

//ピッカービュー
extension FlashSettingViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerIndexPath.row {
        case 0:
            return digit.count
        case 1:
            return flashSpeed.count
        case 2:
            return numberOfQuestion.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerIndexPath.row {
        case 0:
            return String(digit[row])
        case 1:
            return String(flashSpeed[row])
        case 2:
            return String(numberOfQuestion[row])
        default:
            return "何も入っていません"
        }
    }
}
