//
//  SplashView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/2/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: UIImage(resource: .launch))
                    .padding(.top, 50)
                Image(uiImage: UIImage(resource: .launchMain))
                    .padding(.top, 30)
                Spacer()
                NavigationLink {
                    LoginView()
                } label: {
                    Text("시작하기")
                    .asRadiusBackground()
                }
    
            }
        }
    }
}


#Preview {
    SplashView()
}
