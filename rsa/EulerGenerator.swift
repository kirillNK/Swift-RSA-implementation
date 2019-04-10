//
//  EulerGenerator.swift
//  rsa
//
//  Created by Кирилл Пархоменко on 10/04/2019.
//  Copyright © 2019 Kirill Parhomenko. All rights reserved.
//

import Cocoa

class EulerGenerator: NSObject {
    
    func getEuler(p: Int, q: Int) -> Int {
        var euler: Int = 0
        euler = (p - 1) * (q - 1)
        
        return euler
    }
    
}
