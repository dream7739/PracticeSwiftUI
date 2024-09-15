//
//  SignInViewModel.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/14/24.
//

import Foundation
import Combine

final class SignInViewModel: ObservableObject {
    @Published var id = ""
    @Published var password = ""
    
    struct Input {
        
    }
    
    struct Output {
        var validationText = CurrentValueSubject<String, Never> ("")
        var validation = CurrentValueSubject<Bool, Never>(false)
    }
    
    var input = Input()
    var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        transform()
    }
    
    func transform() {
        let input = Publishers
            .CombineLatest($id, $password)
        
        let isEmpty = input
            .map { id, password in
                if id.isEmpty || password.isEmpty {
                    return false
                } else {
                    return true
                }
            }
        
        let isCountValid = input
            .map { id, password in
                if id.count < 2 {
                    return false
                } else if password.count < 2 || password.count > 8 {
                    return false
                } else {
                    return true
                }
            }
        
        Publishers
            .CombineLatest(isEmpty, isCountValid)
            .map { $0 && $1 }
            .sink { [weak self] value in
                self?.output.validation.send(value)
                if !value {
                    self?.output.validationText.send("유효한 값을 입력해주세요")
                } else {
                    self?.output.validationText.send("유효한 값입니다")
                }
            }
            .store(in: &cancellable)
        
    }
}
