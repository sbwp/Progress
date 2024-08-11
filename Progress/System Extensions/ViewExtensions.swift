//
//  ViewExtensions.swift
//  Progress
//
//  Created by Sabrina Bea on 6/14/24.
//

import SwiftUI

extension View {
    func tinted(_ tintColor: Color) -> some View {
        return tint(tintColor).accentColor(tintColor)
    }
}
