//
//  WeekChart.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 1/7/23.
//

import SwiftUI
import Charts

struct WeekChart: View {
    var transactions: [Transaction] = []
    var average: Double = 0
    @State var displayTransactions: [String: Double] = [:]
    
    func calculateTotals() {
        transactions.forEach { transaction in
            if displayTransactions[transaction.dayInWeek] == nil {
                displayTransactions[transaction.dayInWeek] = 0
            }
            let prevValue = displayTransactions[transaction.dayInWeek] ?? 0
            
            displayTransactions[transaction.dayInWeek] = prevValue + transaction.amount
        }
    }

    var body: some View {
        Chart() {
            BarMark(
                x: .value("Day", "Sunday"),
                y: .value("Amount", displayTransactions["Sunday"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Day", "Saturday"),
                y: .value("Amount", displayTransactions["Saturday"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Day", "Friday"),
                y: .value("Amount", displayTransactions["Friday"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Day", "Thursday"),
                y: .value("Amount", displayTransactions["Thursday"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Day", "Wednesday"),
                y: .value("Amount", displayTransactions["Wednesday"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Day", "Tuesday"),
                y: .value("Amount", displayTransactions["Tuesday"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            BarMark(
                x: .value("Day", "Monday"),
                y: .value("Amount", displayTransactions["Monday"] ?? 0)
            )
            .clipShape(RoundedRectangle(cornerRadius: 6))
            RuleMark(y: .value("Daily average", average))
                .foregroundStyle(.gray)
                .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
        }
        .foregroundColor(Color(red: 0.363, green: 0.373, blue: 0.988))
        .chartXAxis {
            AxisMarks(values: .automatic) { value in
                AxisValueLabel() {
                    if let stringValue = value.as(String.self) {
                        Text(stringValue.prefix(1))
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

struct WeekChart_Previews: PreviewProvider {
    static var previews: some View {
        WeekChart()
    }
}
