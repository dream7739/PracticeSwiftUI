//
//  UpbitAPI.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/3/24.
//

import Foundation

struct Market: Hashable, Codable {
    let market, koreanName, englishName: String

    enum CodingKeys: String, CodingKey {
        case market
        case koreanName = "korean_name"
        case englishName = "english_name"
    }
}

typealias Markets = [Market]

struct UpbitAPI {
    private init() { }
    
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
