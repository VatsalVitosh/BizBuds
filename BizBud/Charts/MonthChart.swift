//
//  MonthChart.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 1/7/23.
//

import SwiftUI
import Charts

struct MonthChart: View {
    var transactions: [Transaction] = []
    var average: Double = 0
    var daysInMonth: Int = 30
    @State var displayTransactions: [Int: Double] = [:]
    
    func calculateTotals() {
        transactions.forEach { transaction in
            if displayTransactions[transaction.dayInMonth] == nil {
                displayTransactions[transaction.dayInMonth] = 0
            }
            let prevValue = displayTransactions[transaction.dayInMonth] ?? 0
            
            displayTransactions[transaction.dayInMonth] = prevValue + transaction.amount
        }
    }

    var body: some View {
        Chart {
            ForEach((1...daysInMonth).reversed(), id: \.self) { day in
                BarMark(
                    x: .value("Day", "\(day)"),
                    y: .value("Amount", displayTransactions[day] ?? 0)
                )
                .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            RuleMark(y: .value("Daily average", average))
                .foregroundStyle(.gray)
                .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
        }
        .foregroundColor(.white)
        .chartXAxis {
            AxisMarks(values: .automatic) { value in
                if let stringValue = value.as(String.self) {
                    if let intValue = Int(stringValue) {
                        if intValue % 5 == 0 {
                            AxisValueLabel {
                                Text(stringValue)
                                    .font(.caption2)
                            }
                        }
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

struct MonthChart_Previews: PreviewProvider {
    static var previews: some View {
        MonthChart()
    }
}
