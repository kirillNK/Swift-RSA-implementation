//
//  PQChecker.swift
//  rsa
//
//  Created by Кирилл Пархоменко on 10/04/2019.
//  Copyright © 2019 Kirill Parhomenko. All rights reserved.
//

import Cocoa

class PQChecker: NSObject {
    
    let generator = Generator()
    func checkPQ(p: Int, q: Int) -> (Int, Int) {
        //check
        var tempP = p
        var tempQ = q
        var flagP = false
        var flagQ = false
        
        while flagP == false {
            if tempP == 0 {
                tempP = generator.generateP()
            } else {
                flagP = true
            }
        }
        
        while flagQ == false {
            if tempQ == 0 {
                tempQ = generator.generateQ()
            } else {
                flagQ = true
            }
        }
        
        return (tempP,tempQ)
    }
}
