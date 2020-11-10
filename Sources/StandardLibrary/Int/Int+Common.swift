//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 10/11/2020.
//

import Foundation

extension Int {
    
    public var alphabet: String {
        let unicodeIndexStart = Int(UnicodeScalar("a").value)
        let unicodeIndexEnd = Int(UnicodeScalar("z").value)
        
        let index = unicodeIndexStart + self
        
        if index > unicodeIndexEnd {
            let diff = index - unicodeIndexEnd
            return String(UnicodeScalar(unicodeIndexEnd)!) + "\(diff)"
        } else {
            return String(UnicodeScalar(index)!)
        }
    }
}
