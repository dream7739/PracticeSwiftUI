//
//  CircleBorder.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/2/24.
//

import SwiftUI

struct CircleBorder: ViewModifier {
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
        .clipShape(Circle())
        .overlay(Circle().stroke(color, lineWidth: 3.0))
    }
}

extension View {
    func asCircleBorder(color: Color) -> some View {
        return modifier(CircleBorder(color: color))
    }
}
