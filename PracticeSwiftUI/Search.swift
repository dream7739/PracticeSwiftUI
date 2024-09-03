//
//  Search.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/3/24.
//

import Foundation

struct CoinTest: Hashable, Identifiable {
    let id = UUID()
    let fullName: String
    let name: String
    var isClicked: Bool = false
}

let coinList = [
    CoinTest(fullName: "Bitcoin", name: "BTC"),
    CoinTest(fullName: "Ethereum", name: "ETH"),
    CoinTest(fullName: "Ripple", name: "XRP"),
    CoinTest(fullName: "Bitcoin", name: "BTC"),
    CoinTest(fullName: "Ethereum", name: "ETH"),
    CoinTest(fullName: "Ripple", name: "XRP"),
    CoinTest(fullName: "Bitcoin", name: "BTC"),
    CoinTest(fullName: "Ethereum", name: "ETH"),
    CoinTest(fullName: "Ripple", name: "XRP"),
    CoinTest(fullName: "Bitcoin", name: "BTC"),
    CoinTest(fullName: "Ethereum", name: "ETH"),
    CoinTest(fullName: "Ripple", name: "XRP"),
    CoinTest(fullName: "Bitcoin", name: "BTC"),
    CoinTest(fullName: "Ethereum", name: "ETH"),
    CoinTest(fullName: "Ripple", name: "XRP"),
    CoinTest(fullName: "Bitcoin", name: "BTC"),
    CoinTest(fullName: "Ethereum", name: "ETH"),
    CoinTest(fullName: "Ripple", name: "XRP"),
    CoinTest(fullName: "Bitcoin", name: "BTC"),
    CoinTest(fullName: "Ethereum", name: "ETH"),
    CoinTest(fullName: "Ripple", name: "XRP"),
    CoinTest(fullName: "Bitcoin", name: "BTC"),
    CoinTest(fullName: "Ethereum", name: "ETH"),
    CoinTest(fullName: "Ripple", name: "XRP")
    ]
