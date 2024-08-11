//
//  ColorOption.swift
//  Progress
//
//  Created by Sabrina Bea on 6/14/24.
//

import SwiftUI

enum ColorOption: CaseIterable, Codable {
    case defaultColor
    case none
    case red
    case orange
    case yellow
    case green
    case mint
    case teal
    case cyan
    case blue
    case indigo
    case purple
    case pink
    case gray
    
    var color: Color {
        switch self {
        case .defaultColor: return .accentColor
        case .none: return .primary
        case .red: return .red
        case .orange: return .orange
        case .yellow: return .yellow
        case .green: return .green
        case .mint: return .mint
        case .teal: return .teal
        case .cyan: return .cyan
        case .blue: return .blue
        case .indigo: return .indigo
        case .purple: return .purple
        case .pink: return Color(red: 1, green: 0.41, blue: 0.70)
        case .gray: return .gray
        }
    }
    
    var label: String {
        switch self  {
        case .defaultColor: return "Default"
        case .none: return "None"
        case .red: return "Red"
        case .orange: return "Orange"
        case .yellow: return "Yellow"
        case .green: return "Green"
        case .mint: return "Mint"
        case .teal: return "Teal"
        case .cyan: return "Cyan"
        case .blue: return "Blue"
        case .indigo: return "Indigo"
        case .purple: return "Purple"
        case .pink: return "Pink"
        case .gray: return "Gray"
        }
    }
}
