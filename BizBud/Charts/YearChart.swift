//
//  YearChart.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 1/7/23.
//

import SwiftUI
import Charts

struct YearChart: View {
    var transactions: [Transaction] = []
    var average: Double = 0
    @State var displayTransactions: [String: Double] = [:]
    
    func calculateTotals() {
        transactions.forEach { transaction in
            if displayTransactions[transaction.month] == nil {
                displayTransactions[transaction.month] = 0
            }
            let prevValue = displayTransactions[transaction.month] ?? 0
            
            displayTransactions[transaction.month] = prevValue + transaction.amount
        }
    }

    var body: some View {
        Chart {
            BarMark(
                x: .value("Month", "Dec"),
                y: .value("Amount", displayTransactions["Dec"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "Nov"),
                y: .value("Amount", displayTransactions["Nov"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "Oct"),
                y: .value("Amount", displayTransactions["Oct"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "Sep"),
                y: .value("Amount", displayTransactions["Sep"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "Aug"),
                y: .value("Amount", displayTransactions["Aug"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "Jul"),
                y: .value("Amount", displayTransactions["Jul"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "Jun"),
                y: .value("Amount", displayTransactions["Jun"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "May"),
                y: .value("Amount", displayTransactions["May"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "Apr"),
                y: .value("Amount", displayTransactions["Apr"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "Mar"),
                y: .value("Amount", displayTransactions["Mar"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "Feb"),
                y: .value("Amount", displayTransactions["Feb"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Month", "Jan"),
                y: .value("Amount", displayTransactions["Jan"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            RuleMark(y: .value("Monthly average", average))
                .foregroundStyle(.gray)
                .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
        }
        .foregroundColor(.white)
        .chartXAxis {
            AxisMarks(values: .automatic) { value in
                AxisValueLabel() {
                    if let stringValue = value.as(String.self) {
                        Text(stringValue)
                    }
                }
            }
        }
        .chartYAxis {
            AxisMarks(position: .trailing) {
                AxisValueLabel()
                AxisGridLine().foregroundStyle(.clear)
            }
        }
        .padding(.horizontal, 16)
        .frame(height: 147)
        .onAppear {
            calculateTotals()
        }
        .onChange(of: transactions) { _ in
            calculateTotals()
        }
    }
}

struct YearChart_Previews: PreviewProvider {
    static var previews: some View {
        YearChart()
    }
}
