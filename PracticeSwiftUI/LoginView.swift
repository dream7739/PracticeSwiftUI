//
//  LoginView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/2/24.
//

import SwiftUI

struct LoginView: View {
    @State private var inputText = ""
    @State private var mbtiClicked = Array<Bool>(repeating: false, count: 8)
    @State private var isPresented = false
    private var mbtiList = ["E", "S", "T", "J", "I", "N", "F", "P"]
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    ProfileView()
                } label: {
                    ProfileImageView(imageName: "profile_0")
                        .frame(width: 100, height: 100)

                }
                TextField("닉네임을 입력해주세요", text: $inputText)
                    .padding()
                mbtiView()
                Spacer()
                Button(action: {
                    isPresented = true
                }, label: {
                    Text("확인") 
                        .asRadiusBackground()
                })
            }

            .navigationTitle("PROFILE SETTING")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isPresented, content: {
                CompleteView()
            })
          
        }
    }
   
    func mbtiLabel() -> some View {
        Text("MBTI")
            .padding(.trailing, 30)
            .bold()
    }
    
    func mbtiButton(title: String, idx: Int) -> some View {
        Button(action: {
            mbtiClicked[idx].toggle()
            
            if idx > 3 {
                if mbtiClicked[idx % 4] {
                    mbtiClicked[idx % 4].toggle()
                }
            } else {
                if mbtiClicked[idx + 4] {
                    mbtiClicked[idx + 4].toggle()
                }
            }
        }, label: {
            Text(title)
        })
        .padding()
        .frame(width: 40, height: 40)
        .foregroundStyle(mbtiClicked[idx] ? .white : .gray)
        .background(mbtiClicked[idx] ? .blue : .white)
        .clipShape(Circle())
        .overlay(Circle().stroke(mbtiClicked[idx] ? .blue : .gray, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
    }
    
    func mbtiStackView() -> some View {
        VStack {
            HStack {
                ForEach(0..<4) { item in
                    mbtiButton(title: mbtiList[item], idx: item)
                }
            }
            HStack {
                ForEach(4..<8) { item in
                    mbtiButton(title: mbtiList[item], idx: item)
                }
            }
        }
    }
    
    func mbtiView() -> some View {
        HStack(alignment: .top, spacing: 40) {
            mbtiLabel()
            mbtiStackView()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    LoginView()
}
