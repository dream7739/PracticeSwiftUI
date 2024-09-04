//
//  CategoryView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/4/24.
//

import SwiftUI

struct CategoryView: View {
    @State var searchText = ""
    @State var list: [Category] = []
    
    private let item = ["SF", "가족", "스릴러", "멜로", "느와르", "공포"]
    
    var body: some View {
        NavigationWrapper {
            CategoryListView(list: $list)
                .navigationTitle("영화 검색")
                .navigationBar(leading: {
                    EmptyView()
                }, trailing: {
                    Button(action: {
                        list.append(Category(name: item.randomElement()!, count: .random(in: 1...100)))
                    }, label: {
                        Text("추가")
                    })
                })
                .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "영화를 검색해보세요")
            
        }
    }
}

struct CategoryRowView: View {
    let content: String
    
    init(content: String) {
        self.content = content
    }
    
    var body: some View {
        NavigationLink {
            
        } label: {
            HStack {
                Image(systemName: "person")
                Text(content)
            }
        }
    }
}

struct CategoryListView: View {
    @Binding var list: [Category]
    
    var body: some View {
        List(list, id: \.id) { item in
            let content = item.name + "(\(item.count.formatted()))"
            CategoryRowView(content: content)
        }
    }
}

#Preview {
    CategoryView()
}
