//
//  ImageDetailView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/4/24.
//

import SwiftUI

struct ImageDetailView: View {
    @Binding var section: String
    @State var inputText: String = ""
    
    var body: some View {
        VStack {
            PosterView()
                .frame(width: 200, height: 250)
            .clipped()
            TextField(section, text: $inputText)
                .multilineTextAlignment(.center)
        }
        .onDisappear {
            section = inputText.isEmpty ?  section : inputText
        }
        
    }
}

#Preview {
    ImageDetailView(section: .constant("섹션 타이틀"))
}
