//
//  UIApplication+.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/13/24.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
