//
//  ContentView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 8/22/24.
//

import SwiftUI

struct ContentView: View {
    private var cardView: some View {
        VStack {
            Image(systemName: "heart")
            Text("토스뱅크")
        }
        .padding()
    }
    var body: some View {
        VStack {
            HStack {
                cardView
                Spacer()
                cardView
                Spacer()
                cardView
            }
            .frame(maxWidth: .infinity)
            .background(.yellow)

            Text("포인트를 더 모을 수 있게 맞춤 혜택을 추천해드릴까요?")
                .font(.title)
            
            VStack {
              EventView(image: "heart", text: "매일 포인트 받는 출석체크 퀴즈")
                EventView(image: "heart", text: "새로운 이벤트")
                EventView(image: "heart", text: "미션 추천")
            }
            
            Spacer()
            
            Text("[선택] 맞춤형 서비스 이용 동의")
                .foregroundStyle(.gray)
            
            VStack {
                Button("동의하기") {}
                    .asRadiusBackground()
                
                
                Button("다음에 하기"){ }
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct EventView: View {
    let image: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
            .foregroundStyle(.tint)
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
    }
}
