//
//  APIManager.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/11/24.
//

import Foundation


struct APIManager {
    private init() { }
    
    enum APIError: Error {
        case invalidURL
        case invalidStatus
        case failDecoding
    }   
    static func fetchBooks(request: BookRequest) async throws -> BookResponse {
        var component = URLComponents(string: APIURL.naver)
        let query = URLQueryItem(name: "query", value: request.query)
        let start = URLQueryItem(name: "start", value: "\(request.start)")
        let display = URLQueryItem(name: "display", value: "\(request.display)")
        
        component?.queryItems = [query, start, display]
        
        guard let url = component?.url else { throw APIError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = [
            "X-Naver-Client-Id" : APIKey.clientID,
            "X-Naver-Client-Secret": APIKey.clientSecret
        ]
        
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidStatus
        }
        
        guard let decodedData = try? JSONDecoder().decode(BookResponse.self, from: data) else {
            throw APIError.failDecoding
        }
        
        return decodedData
    }
}
