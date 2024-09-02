//
//  CapsuleBackground.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/2/24.
//

import SwiftUI

struct CapsuleBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

extension View {
    func asCapsuleBackground() -> some View {
        return modifier(CapsuleBackground())
    }
}
