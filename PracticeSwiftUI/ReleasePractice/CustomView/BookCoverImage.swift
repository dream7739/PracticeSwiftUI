//
//  BookCoverImage.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/11/24.
//

import SwiftUI

struct BookCoverImage: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) {
            result in
            switch result {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
            case .failure:
                Image(systemName: "star")
            @unknown default:
                Image(systemName: "star")
            }
        }
        .frame(width: 60, height: 80)
    }
}

#Preview {
    BookCoverImage(url: "https://search.shopping.naver.com/book/catalog/50259596640")
}
