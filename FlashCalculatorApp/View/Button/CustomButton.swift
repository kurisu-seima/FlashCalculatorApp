//
//  CustomButton.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/06.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear
    
    override func draw(_ rect: CGRect) {
        self.layer.borderColor = borderColor.cgColor
    }
}
