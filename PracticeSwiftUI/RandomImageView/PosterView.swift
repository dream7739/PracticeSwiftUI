//
//  PosterView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/4/24.
//

import SwiftUI

struct PosterView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/200/300")) {
            result in
            switch result {
            case .empty:
                ProgressView()
            case .success(let image):
                image
            case .failure:
                Image(systemName: "star")
            @unknown default:
                Image(systemName: "star")
            }
        }
        .frame(width: 110, height: 150)
 
    }
}

#Preview {
    PosterView()
}
