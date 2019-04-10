//
//  PrimeChecker.swift
//  rsa
//
//  Created by Кирилл Пархоменко on 10/04/2019.
//  Copyright © 2019 Kirill Parhomenko. All rights reserved.
//

import Cocoa

class PrimeChecker: NSObject {
    
    func isPrimeFermaMethod(number: Int) -> Bool {
        
        if (number <= 1) { return false }
        if (number == 2){ return true }
        if (number % 2 == 0){ return false }
        
        let tempNumber: Double = Double(number)
        let boundary: Int = Int(round(tempNumber.squareRoot()))
        
        for i in stride(from: 3, to: (boundary + 1), by: 2) { if (number % i == 0) { return false } }
        
        return true
    }
}
