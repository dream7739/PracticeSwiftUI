//
//  SearchView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/3/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var filterList: [CoinTest] {
        return searchText.isEmpty ? coinList : coinList.filter { $0.fullName.contains(searchText) }
    }
        
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(filterList) { item in
                        rowView(item)
                    }
                }
                .navigationTitle("Search")
                .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "검색어를 입력하세요")
            }
        }
    }
    
    func rowView(_ item: CoinTest) -> some View {
        VStack {
            HStack {
                Image(systemName: "heart")
                    .frame(width: 50, height: 50)
                    .background(Color.random())
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(item.fullName)
                        .bold()
                    Text(item.name)
                        .font(.callout)
                }
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "star")
                        .foregroundColor(.gray)

                })
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 3)
            
            Divider()
        }
        
        
    }
}

#Preview {
    SearchView()
}
