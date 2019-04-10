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
    
    func generateP() -> Int {
        var p: Int = 0
        p = Int.random(in: 1...10000)
        if checker.isPrimeFermaMethod(number: p) {
            return p
        } else {
            return 0
            //TODO: add message
        }
    }
    
    
    
    func generateQ() -> Int {
        var q: Int = 0
        q = Int.random(in: 1...10000)
        if checker.isPrimeFermaMethod(number: q) {
            return q
        } else {
            return 0
            //TODO: add message
        }
    }
    
    
    func generateN() -> Int {
        var n: Int = 0
        n = p * q
        
        return n
    }
    
    
    func generateD() -> Int { //check func
        var d: Int = 0
        d = Int.random(in: 1...10000)
        if isCoPrime(num1: d, num2: euler) {
            return d
        } else {
            generateD()
        }
        return d
    }
}
