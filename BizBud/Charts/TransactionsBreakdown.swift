//
//  TransactionsBreakdown.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 9/7/23.
//

import SwiftUI
import Charts

struct TransactionsBreakdown: View {
    var transactions: [Transaction] = []

    var body: some View {
        ScrollView(.horizontal) {
            Chart(transactions) {
                BarMark(
                    x: .value("Amount", $0.amount)
                )
                .foregroundStyle(by: .value("Category", $0.category?.name ?? ""))
            }
            .frame(height: 30)
            .chartXAxis(.hidden)
            .frame(height: 48)
            .padding(.horizontal, 16)
        }
        .environment(\.layoutDirection, .leftToRight)
    }
}

struct TransactionsBreakdown_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsBreakdown()
    }
}
