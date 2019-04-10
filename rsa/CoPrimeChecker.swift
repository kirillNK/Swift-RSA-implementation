//
//  CoPrimeChecker.swift
//  rsa
//
//  Created by Кирилл Пархоменко on 10/04/2019.
//  Copyright © 2019 Kirill Parhomenko. All rights reserved.
//

import Cocoa

class CoPrimeChecker: NSObject {
    func isCoPrime(num1: Int, num2: Int) -> Bool {
        if (num1 == num2) {
            return num1 == 1
        } else {
            if (num1 > num2) {
                return isCoPrime(num1: (num1 - num2), num2: num2)
            } else {
                return isCoPrime(num1: (num2 - num1), num2: num1)
            }
        }
    }
}
