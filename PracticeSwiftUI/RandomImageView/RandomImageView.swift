//
//  RandomImageView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/4/24.
//

import SwiftUI

struct RandomImageView: View {
    @State private var sections = [
        "첫번째 섹션",
        "두번째 섹션",
        "세번째 섹션",
        "네번째 섹션"
    ]
    var body: some View {
        NavigationWrapper {
            ScrollView(.vertical) {
                sectionListView()
            }
            .navigationTitle("My Random Image")
            .padding(.top, 10)
        }
        
    }
    
    //한 개의 섹션
    func sectionView(sectionTitle: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            SectionView(sectionTitle: sectionTitle)
            HorizontalSectionView(sectionTitle: sectionTitle)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 3)
    }
    
    //전체 리스트
    func sectionListView() -> some View {
        ForEach($sections, id: \.self) { $item in
            sectionView(sectionTitle: $item)
        }
    }
}

#Preview {
    RandomImageView()
}
