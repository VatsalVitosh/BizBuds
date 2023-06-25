//
//  Transactions.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 18/6/23.
//

import SwiftUI

struct Transactions: View {
    @State private var timeFilter = Period.week
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TotalBox()
                
                TransactionList().background(Color.white.shadow(radius:10))
            }
                .navigationTitle("Transactions")
        }
    }
}

struct Transactions_Previews: PreviewProvider {
    static var previews: some View {
        Transactions()
    }
}
