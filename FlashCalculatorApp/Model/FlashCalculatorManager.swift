//
//  FlashCalculatorManager.swift
//  FlashCalculatorApp
//
//  Created by 栗須星舞 on 2021/01/14.
//

import Foundation

class FlashCalculatorManager {
    
    private init() {}
    static let shared = FlashCalculatorManager()
    
    var numberOfDigit = 2
    var numberOfQuestion = 10
    var flashSpeed = 1
    
}
