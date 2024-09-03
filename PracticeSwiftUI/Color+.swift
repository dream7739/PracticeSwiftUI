//
//  Color+.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/3/24.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
