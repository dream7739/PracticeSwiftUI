//
//  SearchBarView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/13/24.
//

import SwiftUI

//searchable을 사용하면, navigationBar 영역에 검색바를 사용할 수 있음
//커스텀하고 싶을 때는 textField를 써봐도 될 것 같음
struct SearchBarView: View {
    @State private var text = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            TextField("검색할 책을 입력하세요", text: $text)
                .autocorrectionDisabled(true)
                .foregroundStyle(.black)
            Image(systemName: "xmark.circle.fill")
                .foregroundStyle(.gray)
                .opacity(text.isEmpty ? 0 : 1)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                    text = ""
                }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.gray.opacity(0.1))
        )
        
        
    }
}

#Preview {
    SearchBarView()
}
