//
//  ZstackOverlayView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/12/24.
//

import SwiftUI

/* ZStack Overlay 겹치는건 알겠는데 뭔 차이에요
 ZStack
 - 뷰를 위로 겹겹이 쌓음
 - View를 독립적으로 취급해서, 가장 큰 width, heightdp 따라 size를 결정
 
 Overlay
 - 뷰를 위로 올려서 중첩되고 정렬기준이 아래로 깔리는 뷰가 기준이 됨
 
 Background
 - 아래쪽으로 뷰를 깔아줌
*/
struct ZstackOverlayView: View {
    var body: some View {
        testBackground()
    }
    
    
    func testZStack() -> some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.red)
                .frame(width: 200, height: 200)
            RoundedRectangle(cornerRadius: 10)
                .fill(.orange)
                .frame(width: 150, height: 150)
            RoundedRectangle(cornerRadius: 10)
                .fill(.green)
                .frame(width: 100, height: 100)
        }
    }
    
    func testOverlay() -> some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundStyle(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.cyan,
                                Color.blue
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        )
                    .frame(width: 100, height: 100)
                    .shadow(color: .blue, radius: 7, x: 0, y: 5)
                    .overlay(alignment: .topTrailing) {
                        //overlay기준이 백그라운드로 설정한 뷰가 됨
                        Circle()
                            .fill(.red)
                            .frame(width: 35, height: 35)
                            .overlay(alignment: .center) {
                                Text("13")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                    }
            )
    }
    
    func testBackground() -> some View {
        Text("독서중")
            .font(.caption2)
            .foregroundStyle(.gray)
            .padding(3)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray.opacity(0.1))
                
            }
        

    }

}

#Preview {
    ZstackOverlayView()
}
