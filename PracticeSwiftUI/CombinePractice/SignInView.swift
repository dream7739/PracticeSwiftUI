//
//  SignInView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/14/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            signInTextField("아이디를 입력하세요", $viewModel.id)
            signInTextField("비밀번호를 입력하세요", $viewModel.password)
            validationText()
            signInButton()
        }
        .padding()
    }
    
    func signInTextField(_ placeholder: String, _ binding: Binding<String>) -> some View {
        HStack {
            TextField(placeholder, text: binding)
        }
        .padding(10)
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
    
    func validationText() -> some View {
        Text(viewModel.output.validationText.value)
            .font(.caption)
            .foregroundStyle(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 5)
    }
    
    func signInButton() -> some View {
        Button(action: {
            print("로그인")
        }, label: {
            Text("로그인")
                .frame(maxWidth: .infinity)
                .padding()
                .background(viewModel.output.validation.value ? .blue: .gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
        })
    }
}


#Preview {
    SignInView()
}
