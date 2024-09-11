//
//  GridPracticeView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/11/24.
//

import SwiftUI

//adaptive fixed flexible ?
//HGrid VGrid?
//VGrid >> FlowLayout처럼 가로로 쌓이다가 아래로 떨어지는 식
//HGrid >> 세로로 쌓이다가 공간없으면 가로로 쌓임
struct GridPracticeView: View {
    var body: some View {
        VStack {
            fixedGridView()
        }
    }
    
    // 기기사이즈에 맞게 배치됨
    // 최소 크기 항목을, 최대한 많이 삽입하는 것을 목표로 함
    // columns가 내가 지정한 항목보다 많이 배치될 수 있음
    func adaptiveGridView() -> some View {
        let item = GridItem(.adaptive(minimum: 180, maximum: 180), spacing: 10)
        let columns = Array(repeating: item, count: 2)
        
        return ScrollView(.vertical) {
            LazyVGrid(columns: columns, content: {
                ForEach(0..<10) { item in
                    RectangleView()
                }
            })
            .padding()
        }
    }
    
    //기기가 바뀌더라도, 내가 지정한 컬럼 수만큼 나옴
    //고정된 영역을 알아서 나눠서 쓴다
    func flexibleGridView() -> some View {
        let item = GridItem(.flexible(minimum: 180, maximum: .infinity), spacing: 10)
        let columns = Array(repeating: item, count: 2)
        
        return ScrollView(.vertical) {
            LazyVGrid(columns: columns, content: {
                ForEach(0..<10) { item in
                    RectangleView()
                }
            })
            .padding()
        }
    }
    
    //기기가 커지더라도, 그냥 고정(width)
    //fixed가 아닌 경우는 기기에 따라 늘어날 수 있음
    func fixedGridView() -> some View {
        let item = GridItem(.fixed(180), spacing: 10)
        let columns = Array(repeating: item, count: 2)
        
        return ScrollView(.vertical) {
            LazyVGrid(columns: columns, content: {
                ForEach(0..<10) { item in
                    RectangleView()
                }
            })
            .padding()
        }
    }
    
}

struct RectangleView: View {
    var body: some View {
       RoundedRectangle(cornerRadius: 15)
            .fill(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
            .frame(height: 180)
    }
}

#Preview {
    GridPracticeView()
}
