//
//  ProfileView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/3/24.
//

import SwiftUI

struct ProfileView: View {
    @State var isSelected = Array<Bool>(repeating: false, count: 12)
    
    let data = Array(0...11).map { "profile_\($0)" }
    let columns = [GridItem(.adaptive(minimum: 80, maximum: 80))]
    
    var body: some View {
        NavigationView {
            VStack {
                ProfileImageView(imageName: "profile_0")
                    .frame(width: 100, height: 100)
                .padding(.vertical, 30)
                
                profileSelectView()
                
                Spacer()
            }
            .navigationTitle("PROFILE SETTING")
            .navigationBarTitleDisplayMode(.inline)
        }
       
    }
    
    func profileSelectView() -> some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<12) { item in
                Button(action: {
                    for idx in 0...11 {
                        if item == idx {
                            isSelected[idx] = true
                        } else {
                            isSelected[idx] = false
                        }
                    }
                }, label: {
                    ProfileImageView(imageName: data[item],
                                     borderColor: isSelected[item] ? .blue : .gray)
                        .frame(width: 80, height: 80)
                })
            }
        }
    }
}

#Preview {
    ProfileView()
}
