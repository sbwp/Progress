//
//  Item.swift
//  Progress
//
//  Created by Sabrina Bea on 6/14/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class Project {
    var title: String
    var start: Date
    var end: Date
    var completed: Bool
    var includeTime: Bool
    var color: ColorOption
    
    var length: Double {
        return Double(Calendar.current.dateComponents([.second], from: start, to: end).second!).clampToMin(1)
    }
    
    var currentProgress: Double {
        return Double(Calendar.current.dateComponents([.second], from: start, to: Date()).second!).clampBetween(0, and: length)
    }
    
    init(title: String, start: Date, end: Date) {
        self.title = title
        self.start = start
        self.end = end
        self.completed = false
        self.includeTime = false
        self.color = .defaultColor
    }
    
    // convenience initializer for dummy data
    convenience init() {
        self.init(title: "Make Dinner", start: Date().addDays(-30), end: Date().addDays(60))
    }
}
