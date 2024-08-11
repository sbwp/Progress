//
//  Integer.swift
//  Progress
//
//  Created by Sabrina Bea on 6/14/24.
//

import Foundation

protocol Numeric: Comparable {}

extension Numeric {
    func clampBetween(_ min: Self, and max: Self) -> Self {
        return self < min ? min : (self > max ? max : self)
    }
    
    func clampToMin(_ min: Self) -> Self {
        return self < min ? min : self
    }
    
    func clampToMax(_ max: Self) -> Self {
        return self > max ? max : self
    }
}

extension Int: Numeric {}
extension Double: Numeric {}
extension Float: Numeric {}
