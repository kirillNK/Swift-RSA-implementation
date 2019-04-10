//
//  stringExtension.swift
//  rsa
//
//  Created by Кирилл Пархоменко on 10/04/2019.
//  Copyright © 2019 Kirill Parhomenko. All rights reserved.
//

extension String {
    
    public func splitedBy(length: Int) -> [String] {
        var result = [String]()
        
        for i in stride(from: 0, to: self.count, by: length) {
            let endIndex = self.index(self.endIndex, offsetBy: -i)
            let startIndex = self.index(endIndex, offsetBy: -length, limitedBy: self.startIndex) ?? self.startIndex
            result.append(String(self[startIndex..<endIndex]))
        }
        
        return result.reversed()
    }
}
