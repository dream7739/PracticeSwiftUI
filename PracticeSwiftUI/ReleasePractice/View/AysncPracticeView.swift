//
//  AysncPracticeView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/11/24.
//

import SwiftUI

struct AysncPracticeView: View {
    //PropertyWrapper > var
    //ObservedObject vs StateObject
    //ObservedObject : 하위뷰일 경우 상위뷰의 변동이 생겼을 때 다시 그려지면서 초기화됨
    //StateObject : 하위뷰일 경우, 상위뷰의 변동이 생겼을 때 다시 그려지더라도 초기값을 들고 있음
    @ObservedObject private var viewModel = AsyncPractiveViewModel()
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.blue)
                .padding(10)
            Text("Hello, World!")
        }
        .task {
            viewModel.input.viewOnTask.send(())
        }
    }
}

#Preview {
    AysncPracticeView()
}
