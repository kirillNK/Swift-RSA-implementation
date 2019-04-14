//
//  EncryptionAndDecryption.swift
//  rsa
//
//  Created by Кирилл Пархоменко on 14/04/2019.
//  Copyright © 2019 Kirill Parhomenko. All rights reserved.
//

import Cocoa

class EncryptionAndDecryption: NSObject {
    
    func encryptMessage(arrayOfInts: [Int], paramE: Int, paramN: Int) -> [Int] {
        var result = [Int]()
        
        for element in arrayOfInts {
            let powElement = pow(Double(element), Double(paramE))
            let subResult = Int(powElement) % paramN
            //TODO: add Int max chaeck
            result.append(subResult)
        }
        
        return result
    }
    
    
    func decryptMessage(arrayOfInts: [Int], paramD: Int, paramN: Int) -> [Int] {
        var result = [Int]()
        
        for element in arrayOfInts {
            let powElement = pow(Double(element), Double(paramD))
            let subResult = Int(powElement) % paramN
            result.append(subResult)
        }
        
        return result
    }
}
