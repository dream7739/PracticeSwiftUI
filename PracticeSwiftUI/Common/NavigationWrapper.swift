//
//  NavigationWrapper.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/4/24.
//

import SwiftUI

//iOS16 + : NavigationStack
//iOS16 - : NavigationView
struct NavigationWrapper<Content: View> : View {
    
    let content: Content
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                content
            }
        } else {
            NavigationView {
                content
            }
        }
    }
}

