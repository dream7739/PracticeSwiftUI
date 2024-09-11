//
//  APIManager.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/11/24.
//

import Foundation

struct APIManager {
    private init() { }
    
    typealias Markets = [Market]
    
    static func fetchAllMarket(completion: @escaping (Markets) -> Void ) {
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    let decodedData = try JSONDecoder().decode(Markets.self, from: data)
                    completion(decodedData)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
