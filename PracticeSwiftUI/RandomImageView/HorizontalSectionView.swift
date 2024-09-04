//
//  HorizontalSectionView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/4/24.
//

import SwiftUI

struct HorizontalSectionView: View {
    @Binding var sectionTitle: String
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<6) { item in
                    NavigationLink {
                        NavigationLazyView(ImageDetailView(section: $sectionTitle))
                    } label: {
                        PosterView()
                            .clipShape(
                                .rect(
                                    cornerRadii: .init(
                                        topLeading: 10,
                                        bottomLeading: 10,
                                        bottomTrailing: 10,
                                        topTrailing: 10
                                    )
                                )
                            )
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        
    }
}

struct SectionView: View {
    @Binding var sectionTitle: String
    
    var body: some View {
        Text(sectionTitle)
            .font(.title3)
    }
}

#Preview {
    HorizontalSectionView(sectionTitle: .constant("첫번째 섹션"))
}
