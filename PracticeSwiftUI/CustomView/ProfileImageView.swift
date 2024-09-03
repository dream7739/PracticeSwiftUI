//
//  ProfileImageView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/3/24.
//

import SwiftUI

struct ProfileImageView: View {
    let imageName: String
    let borderColor: Color
    
    init(imageName: String, borderColor: Color = .blue) {
        self.imageName = imageName
        self.borderColor = borderColor
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .asCircleBorder(color: borderColor)
    }
}

#Preview {
    ProfileImageView(imageName: "profile_0")
}
