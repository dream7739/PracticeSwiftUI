//
//  CircleBorder.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/2/24.
//

import SwiftUI

struct CircleBorder: ViewModifier {
    func body(content: Content) -> some View {
        content
        .frame(width: 100, height: 100)
        .clipShape(Circle())
        .overlay(Circle().stroke(.blue, lineWidth: 3.0))
    }
}

extension View {
    func asCircleBorder() -> some View {
        return modifier(CircleBorder())
    }
}
