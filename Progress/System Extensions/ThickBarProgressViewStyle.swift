//
//  ThickBarProgressViewStyle.swift
//  Progress
//
//  Created by Sabrina Bea on 6/14/24.
//

import SwiftUI

struct ThickBarProgressViewStyle: ProgressViewStyle {
    let height: CGFloat
    let cornerRadius: CGFloat
    let roundedCornerStyle: RoundedCornerStyle
    
    init(height: CGFloat = 16, cornerRadius: CGFloat = 20, roundedCornerStyle: RoundedCornerStyle = .continuous) {
        self.height = height
        self.cornerRadius = cornerRadius
        self.roundedCornerStyle = roundedCornerStyle
    }
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius, style: roundedCornerStyle)
                    .foregroundStyle(Color.secondary.opacity(0.25))
                HStack {
                    RoundedRectangle(cornerRadius: cornerRadius, style: roundedCornerStyle)
                        .foregroundStyle(Color.accentColor)
                        .frame(width: geo.size.width * (configuration.fractionCompleted ?? 0))
                    Spacer(minLength: 0)
                }
            }
        }
        .frame(height: height)
    }
}

#Preview {
    NavigationStack {
        ProgressView(value: 0.5, total: 1)
            .progressViewStyle(ThickBarProgressViewStyle())
            .tinted(Color.green)
            .padding()
    }
}
