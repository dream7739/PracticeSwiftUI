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
    
    var body: some View {
        NavigationWrapper {
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
            .onSubmit(of: .search){
                marketList = searchText.isEmpty ? marketList: marketList.filter { $0.koreanName.contains(searchText) }
            }
            .navigationTitle("My Money")
            .navigationBar {
                Image(systemName: "heart.fill")
            } trailing: {
                Image(systemName: "heart")
            }

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
 
    func listView() -> some View {
        LazyVStack {
            ForEach($marketList, id: \.self) { $item in
                NavigationLink {
                    NavigationLazyView(DetailCoinView(coinName: item.koreanName))
                } label: {
                    RowView(item: $item)
                }.buttonStyle(PlainButtonStyle())

            }
        }
    }
}

struct RowView: View {
    @Binding var item: Market
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.koreanName)
                    .bold()
                Text(item.market)
            }
            Spacer()
            Text(item.englishName)
            Button(action: {
                item.like.toggle()
            }, label: {
                Image(systemName: item.like ? "star.fill" : "star")
                    .foregroundStyle(.gray)
            })
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 6)
    }
}

#Preview {
    CoinView()
}
