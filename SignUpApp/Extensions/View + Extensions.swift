//
//  View + Extensions.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 13/12/2021.
//

import SwiftUI

struct TextStyleModifier: ViewModifier {
    
    var size: CGFloat
    var weight: Font.Weight
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: self.size, weight: self.weight))
            .foregroundColor(self.color)
    }
    
}

extension View {
    
    func textStyle(size: CGFloat, weight: Font.Weight, color: Color) -> some View {
        self.modifier(TextStyleModifier(size: size, weight: weight, color: color))
    }
    
}
