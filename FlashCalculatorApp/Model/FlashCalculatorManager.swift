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
    var flashSpeed = 1
    var numberOfQuestion = 10
    
    var maxValue: Int {
        return Int(Array<Int>(1...numberOfDigit).map{ _ in return "9" }.joined())!
    }
    
    var minValue: Int {
        var min = Array<Int>(1...numberOfDigit).map{ _ in return "0"}
        min[0] = "1"
        return Int(min.joined())!
    }
}
