//
//  CoinView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/3/24.
//

import SwiftUI

struct CoinView: View {
    @State private var marketList: Markets = []
    @State private var randomMarket = ""
    @State private var searchText = ""
    
    var filteredList: Markets {
        return searchText.isEmpty ? marketList: marketList.filter({ $0.koreanName.contains(searchText) })
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                bannerView()
                listView()
            }
            .refreshable {
                UpbitAPI.fetchAllMarket { data in
                    marketList = data
                    randomMarket = data.randomElement()?.koreanName ?? ""
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer, prompt: "검색어를 입력하세요")
            .navigationTitle("My Money")
        }.task {
            UpbitAPI.fetchAllMarket { data in
                marketList = data
                randomMarket = data.randomElement()?.koreanName ?? ""
            }
        }
    }
    
    func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.green)
                .frame(height: 150)
                .overlay(alignment: .leading) {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .scaleEffect(2.0)
                        .offset(x: -40, y: 0)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding()
            
            VStack(alignment: .leading) {
                Spacer()
                Text(randomMarket)
                    .font(.callout)
                    .bold()
                Text("345,678,910")
                    .font(.title)
                    .bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(40)
            .foregroundStyle(.white)
            
        }
        
    }
    
    func rowView(_ item: Market) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(item.koreanName)")
                    .bold()
                Text("\(item.market)")
            }
            Spacer()
            Text("\(item.englishName)")
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 6)
    }
    
    func listView() -> some View {
        LazyVStack {
            ForEach(filteredList, id: \.self) { item in
                NavigationLink {
                    DetailCoinView(coinName: item.koreanName)
                } label: {
                    rowView(item)
                        .foregroundStyle(.black)
                }

            }
        }
    }
}

#Preview {
    CoinView()
}
