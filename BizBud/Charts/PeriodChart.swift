//
//  PeriodChart.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 1/7/23.
//

import SwiftUI

struct PeriodChart: View {
    @EnvironmentObject var realmManager: RealmManager
    
    @State private var periodString: String = ""
    @State private var displayTransactions: [Transaction] = []
    @State private var totalForPeriod: Double = 0
    @State private var averageForPeriod: Double = 0
    @State private var daysInMonth: Int = 30
    
    var period: Period = Period.week
    var transactions: [Transaction] = []
    var periodIndex: Int = 0
    
    func formatDateRange(startDate: Date, endDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        var format = ""

        switch period {
        case Period.day:
            break
        case Period.week:
            dateFormatter.dateFormat = "d MMM"
            format = "\(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate))"
        case Period.month:
            dateFormatter.dateFormat = "MMM"
            format = "\(dateFormatter.string(from: startDate))"
        case Period.year:
            dateFormatter.dateFormat = "yyyy"
            format = "\(dateFormatter.string(from: startDate))"
        }
        
        return format
    }
    
    func setupData() {
        let (newTransactions, range) = filterTransactionsInPeriod(period: period, transactions: realmManager.transactions, periodIndex: periodIndex)
        var total: Double = 0
        var average: Double = 0

        newTransactions.forEach { transaction in
            total += transaction.amount
        }

        switch period {
        case Period.day:
            break
        case Period.week:
            average = total / 7
        case Period.month:
            let numOfDays = (Calendar.current.dateComponents([.day], from: range.lowerBound, to: range.upperBound).day!) + 1
            average = total / Double(numOfDays)
            daysInMonth = numOfDays
        case Period.year:
            average = total / 12
        }

        periodString = formatDateRange(startDate: range.lowerBound, endDate: range.upperBound)
        totalForPeriod = total
        averageForPeriod = average
        displayTransactions = newTransactions
    }

    var body: some View {
        VStack {
            PeriodOverview(period: periodString, totalForPeriod: totalForPeriod, averageForPeriod: averageForPeriod)
                .id(displayTransactions)
            
            switch period {
            case .day:
                Text("")
            case .week:
                WeekChart(transactions: displayTransactions, average: averageForPeriod)
                    .id(displayTransactions)
            case .month:
                MonthChart(transactions: displayTransactions, average: averageForPeriod, daysInMonth: daysInMonth)
                    .id(displayTransactions)
            case .year:
                YearChart(transactions: displayTransactions, average: averageForPeriod)
                    .id(displayTransactions)
            }
            
            TransactionsBreakdown(transactions: displayTransactions)
            
            TransactionsList(transactions: groupTransactionsByDate(filterTransactionsInPeriod(period: period, transactions: displayTransactions, periodIndex: periodIndex).transactions))
        }
        .onAppear {
            setupData()
        }
    }
}

struct PeriodChart_Previews: PreviewProvider {
    static var previews: some View {
        PeriodChart()
            .environmentObject(RealmManager())
    }
}
