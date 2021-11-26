//
//  Model.swift
//  PointsBalls
//
//  Created by Ilya Shpilko on 11/13/21.
//

import Foundation

class HelperModel {    
    func resultScore(productName name: String, price sum: String) -> String {
        var firstIndex = 0
        var secondIndex = 0
        let namesProductsArray = [["0.7", "1.0", "1.7", "2.5", "3.0"],
                                  ["0.9", "1.2", "2.5", "3.5", "4.0"],
                                  ["1.0", "1.3", "2.8", "3.8", "4.5"]]
        
        guard let sum = Int(sum) else { return ""}
        
        switch name {
        case "POS A": firstIndex = 0
        case "POS_N до 12 мес.": firstIndex = 1
        case "POS_N более 12 мес.": firstIndex = 2
        default: break
        }
        
        switch sum {
        case 1...20_000: secondIndex = 0
        case 20_001...30_000: secondIndex = 1
        case 30_001...60_000: secondIndex = 2
        case 60_001...80_000: secondIndex = 3
        case 80_001...: secondIndex = 4
        default: break
        }
        
        return namesProductsArray[firstIndex][secondIndex]
    }
}
