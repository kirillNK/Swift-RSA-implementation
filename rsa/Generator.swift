//
//  Generator.swift
//  rsa
//
//  Created by Кирилл Пархоменко on 10/04/2019.
//  Copyright © 2019 Kirill Parhomenko. All rights reserved.
//

import Cocoa

class Generator: NSObject {
    
    let checker = PrimeChecker()
    let isCoPrimeChecker = CoPrimeChecker()
    let iterationCount = 100
    
    func generateP() -> Int {
        var p = Int.random(in: 1...iterationCount)
        while checker.isPrimeFermaMethod(number: p) == false {
            p = Int.random(in: 1...iterationCount)
        }
        return p
    }
    
    
    
    func generateQ() -> Int {
        var q = Int.random(in: 1...iterationCount)
        while checker.isPrimeFermaMethod(number: q) == false {
            q = Int.random(in: 1...iterationCount)
        }
        return q
    }
    
    
    func generateN(p: Int, q: Int) -> Int {
        var n: Int = 0
        n = p * q
        
        return n
    }
    
    
    func generateD(euler: Int) -> Int {
        var d = Int.random(in: 1...iterationCount)
        while isCoPrimeChecker.isCoPrime(num1: d, num2: euler) {
            d = Int.random(in: 1...iterationCount)
        }
        
        return d
    }
    
    
    func generateE(paramD: Int, euler: Int) -> Int {
        var e: Int = 0
        for i in 1...iterationCount {
            while (i * paramD % euler) != 1 {
                break
            }
            e = i
        }
        return e
    }
    
}
