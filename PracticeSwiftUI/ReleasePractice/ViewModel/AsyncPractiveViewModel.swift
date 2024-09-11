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
    
    struct Input {
        //<Output, Failure>
        var viewOnTask = PassthroughSubject<Void, Never>()
        
    }
    
    struct Output {
        
    }
    
    var cancellables = Set<AnyCancellable>()
    var input = Input()
    @Published var output = Output()
    
    
    
    init() {
        transform()
    }
    
    func transform() {
        input.viewOnTask
            .sink { _ in
                print("안녕하세용")
            }
            .store(in: &cancellables)
    }
}
