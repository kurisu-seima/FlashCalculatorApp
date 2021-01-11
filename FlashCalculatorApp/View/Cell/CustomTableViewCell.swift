//
//  CustomTableViewCell.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/09.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitleLabel: UILabel!
    
    var titleList = ["桁数", "速度", "問題数"]
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(index: Int) {
        self.cellTitleLabel.text = titleList[index]
    }
}
