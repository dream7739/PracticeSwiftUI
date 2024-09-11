//
//  RadiusBackground.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 8/27/24.
//

import SwiftUI

struct RadiusBackground: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(.capsule)
            .padding(.horizontal)
            .font(.title3)
    }
    
    
}

extension View {
    func asRadiusBackground() -> some View {
        return modifier(RadiusBackground())
    }
}
