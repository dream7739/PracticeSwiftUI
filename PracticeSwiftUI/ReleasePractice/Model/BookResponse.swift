//
//  BookResponse.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/11/24.
//

import Foundation

struct BookResponse: Decodable, Hashable {
    let total: Int
    let start: Int
    let display: Int
    let items: [Book]
}
        
struct Book: Decodable, Hashable {
    let title: String
    let image: String
    let author: String
    let isbn: String
    let description: String
}
