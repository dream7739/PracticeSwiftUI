//
//  AsyncPractiveViewModel.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/11/24.
//

import Foundation
import Combine

//ViewModel은 class Type -> AnyObject 제약을 줄 수 있음
//Combine
//PassThroughSubject, CurrentValueSubject

protocol PracticeViewModel: AnyObject {
    associatedtype Input
    associatedtype Output
    
    var cancellables: Set<AnyCancellable> { get set }
    var input: Input { get set }
    var output: Output { get set }
    func transform()
    
}


//변화를 감지할 수 있도록 ObservableObject
final class AsyncPractiveViewModel: PracticeViewModel, ObservableObject {
    @Published var searchText = ""
    
    var bookRequest = BookRequest(query: "")
    var bookResponse = BookResponse(total: 0, start: 0, display: 0, items: [])
    
    struct Input {
        //<Output, Failure>
        var callSearch = PassthroughSubject<Void, Never>()
        
    }
    
    struct Output {
        var bookList: [Book] = []
    }
    
    var cancellables = Set<AnyCancellable>()
    var input = Input()
    @Published var output = Output()
    
    init() {
        transform()
    }
    
    func transform() {
        input.callSearch
            .sink { [weak self] _ in
                self?.callRequest()
            }
            .store(in: &cancellables)
    }
    
    
    func callRequest() {
        print(#function, searchText)
        
        let text = searchText.trimmingCharacters(in: .whitespaces).lowercased()
        if text.isEmpty || text == bookRequest.query { return }
        
        bookRequest.start = 1
        bookRequest.query = text
        
        APIManager.fetchBooks(request: bookRequest)
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] data in
                self?.bookResponse = data
                self?.output.bookList = data.items
            }
            .store(in: &cancellables)
    }
    
    func callRequestMore() {
        print(#function, bookRequest.query)
        
        bookRequest.start += 1
        
        APIManager.fetchBooks(request: bookRequest)
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] data in
                self?.bookResponse = data
                self?.output.bookList.append(contentsOf: data.items)
            }
            .store(in: &cancellables)
    }
    
    var isPaginationRequired: Bool {
        let pageCnt = 30
        let afterPageCnt = output.bookList.count + pageCnt
        return bookResponse.total >= afterPageCnt ? true : false
    }
    
}
