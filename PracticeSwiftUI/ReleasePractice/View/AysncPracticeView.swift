//
//  AysncPracticeView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/11/24.
//

import SwiftUI

struct AysncPracticeView: View {
    //PropertyWrapper > var
    //ObservedObject vs StateObject
    //ObservedObject : 하위뷰일 경우 상위뷰의 변동이 생겼을 때 다시 그려지면서 초기화됨
    //StateObject : 하위뷰일 경우, 상위뷰의 변동이 생겼을 때 다시 그려지더라도 초기값을 들고 있음
    @ObservedObject private var viewModel = AsyncPractiveViewModel()
    
    var body: some View {
        NavigationView {
            verticalScrollView()
                .navigationTitle("검색")
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "책 제목을 검색해보세요"
        )
        .onSubmit(of: .search) {
            viewModel.input.callSearch.send(())
        }
        
    }
    
    func verticalScrollView() -> some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(Array(zip(viewModel.output.bookList.indices, viewModel.output.bookList)), id: \.0) { index, item in
                    SearchRowView(book: item)
                        .onAppear {
                            if index == viewModel.output.bookList.count - 4 {
                                if viewModel.isPaginationRequired {
                                    viewModel.callRequestMore()
                                }
                            }
                        }
                }
            }
        }
    }
}

//검색결과가 나오는 뷰
struct SearchRowView: View {
    var book: Book
    
    var body: some View {
        HStack(alignment: .top) {
            BookCoverImage(url: book.image)
            VStack(alignment: .leading) {
                Text(book.title)
                Text(book.author)
                    .font(.callout)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AysncPracticeView()
}
