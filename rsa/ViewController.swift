//
//  ViewController.swift
//  rsa
//
//  Created by Кирилл Пархоменко on 05/04/2019.
//  Copyright © 2019 Kirill Parhomenko. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {
    var primeCount: Int = 0
    var notPrimeCount: Int = 0
    @IBAction func btnPressed(button: NSButton) {
        print("open key: \(paramE) and \(paramN)\nsecret key: \(paramD) and \(paramN)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.title = "RSA enc and dec"
        self.view.window?.styleMask.remove(NSWindow.StyleMask.resizable)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    
    func isPrimeFermaMethod(number: Int) -> Bool {
        
        if (number <= 1) { return false }
        if (number == 2){ return true }
        if (number % 2 == 0){ return false }
        
        let tempNumber: Double = Double(number)
        let boundary: Int = Int(round(tempNumber.squareRoot()))
        
        for i in stride(from: 3, to: (boundary + 1), by: 2) { if (number % i == 0) { return false } }
        
        return true
    }
    
    

    func generateP() -> Int {
        var p: Int = 0
        p = Int.random(in: 1...10000)
        if (isPrimeFermaMethod(number: p)) == true {
            return p
        } else {
            return 0
            //TODO: add message
        }
    }
    
    
    
    func generateQ() -> Int {
        var q: Int = 0
        q = Int.random(in: 1...10000)
        if (isPrimeFermaMethod(number: q)) == true {
            return q
        } else {
            return 0
            //TODO: add message
        }
    }
    
    lazy var tempP = generateP()
    lazy var tempQ = generateQ()
    
    
    
    func checkPQ(p: Int, q: Int) -> (Int, Int) {
        var flagP = false
        var flagQ = false
        
        while flagP == false {
            if tempP == 0 {
                tempP = generateP()
            } else {
                flagP = true
            }
        }
        
        while flagQ == false {
            if tempQ == 0 {
                tempQ = generateQ()
            } else {
                flagQ = true
            }
        }

        return (tempP,tempQ)
    }
    
    
    
    lazy var params = checkPQ(p: tempP, q: tempQ)
    lazy var p = params.0
    lazy var q = params.1
    
    func generateN() -> Int {
        var n: Int = 0
        n = p * q
        
        return n
    }
    
    
    
    lazy var paramN = generateN()
    
    func getEuler() -> Int {
        var euler: Int = 0
        euler = (p - 1) * (q - 1)
        
        return euler
    }
    
    
    
    lazy var euler = getEuler()
    
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
    
    
    
    func generateD() -> Int { //check func
        var d: Int = 0
        d = Int.random(in: 1...10000)
        if (isCoPrime(num1: d, num2: euler) == true) {
            return d
        } else {
            generateD()
        }
        return d
    }
    
    lazy var paramD: Int = generateD()
    
    
    
    func generateE() -> Int {
        var e: Int = 0
        
        for i in 1...1000 {
            while (i * paramD % euler) != 1 {
                break
            }
            e = i
        }
        return e
    }
    
    lazy var paramE = generateE()
    
}

