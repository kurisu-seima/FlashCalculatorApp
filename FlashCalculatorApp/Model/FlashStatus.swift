//
//  FlashStatus.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/11.
//

import Foundation

class FlashStatus {
    var digit: Int
    var flashSpeed: Int
    var numberOfQuestion: Int
    
    init(digit: Int, flashSpeed: Int, numberOfQuestion: Int) {
        self.digit = digit
        self.flashSpeed = flashSpeed
        self.numberOfQuestion = numberOfQuestion
    }
}
