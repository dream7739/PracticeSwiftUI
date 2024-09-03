//
//  DetailCoinView.swift
//  PracticeSwiftUI
//
//  Created by 홍정민 on 9/3/24.
//

import SwiftUI

struct DetailCoinView: View {
    let coinName: String
    
    init(coinName: String) {
        self.coinName = coinName
    }
    
    var body: some View {
        Text(coinName)
    }
}

#Preview {
    DetailCoinView(coinName: "")
}
