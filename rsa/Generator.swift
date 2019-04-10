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
    
    
    func generateN(p: Int, q: Int) -> Int {
        var n: Int = 0
        n = p * q
        
        return n
    }
    
    let primeChecker = CoPrimeChecker()
    func generateD(euler: Int) -> Int { //check func
        var d: Int = 0
        d = Int.random(in: 1...10000)
        if primeChecker.isCoPrime(num1: d, num2: euler) {
            return d
        } else {
            //generateD()
        }
        return d
    }
    
    
    func generateE(paramD: Int, euler: Int) -> Int {
        var e: Int = 0
        
        for i in 1...1000 {
            while (i * paramD % euler) != 1 {
                break
            }
            e = i
        }
        return e
    }
    
    
}
