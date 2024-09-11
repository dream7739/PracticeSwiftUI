//
//  Category.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/4/24.
//

import Foundation

struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}
