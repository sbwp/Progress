//
//  ColorPickerView.swift
//  Progress
//
//  Created by Sabrina Bea on 6/14/24.
//

import SwiftUI

struct ColorPickerView: View {
    let titleKey: String
    @Binding var color: ColorOption
    
    init(_ titleKey: String, color: Binding<ColorOption>) {
        self.titleKey = titleKey
        self._color = color
    }
    
    var body: some View {
        Picker(titleKey, selection: $color) {
            ForEach(ColorOption.allCases, id: \.self) { option in
                Text(option.label)
            }
        }
        .fontWeight(.bold)
        .tinted(color.color)
    }
}

#Preview {
    ColorPickerView("Color", color: .constant(.defaultColor))
}
