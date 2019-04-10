//
//  textConverter.swift
//  rsa
//
//  Created by Кирилл Пархоменко on 10/04/2019.
//  Copyright © 2019 Kirill Parhomenko. All rights reserved.
//

import Cocoa

class textConverter: NSObject {
    
    func ConvertCharToIndex(arrayOfSymbols: [String], alphabetArray: [String]) -> [String] {
        var charToIndexArray = [String]()
        for elementIndex in 0...arrayOfSymbols.count - 1 {
            let charInArrayOfSymbols: String = arrayOfSymbols[elementIndex]
            
            if alphabetArray.contains(charInArrayOfSymbols) {
                let dataToAppend: Int = alphabetArray.firstIndex(of: charInArrayOfSymbols) ?? 0
                charToIndexArray.append(String(dataToAppend))
            }
        }
        
        return charToIndexArray
    }
    
    
    func ConvertIndexToChar(arrayOfSymbols: [String], alphabetArray: [String]) -> [String] {
        var IndexToCharArray = [String]()
        
        return IndexToCharArray
    }
    
}
