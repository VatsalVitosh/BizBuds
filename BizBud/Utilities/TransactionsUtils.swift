//
//  TransactionsUtils.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 1/7/23.
//

import Foundation

typealias TransactionInDate = [String: [Transaction]]
func groupTransactionsByDate(_ transactions: [Transaction]) -> [Dictionary<String, [Transaction]>.Element] {
    
    var result: TransactionInDate = [:]
    
    for transaction in transactions {
        let transactionDate = formatDateToShort(transaction.date)
        
        if result[transactionDate] == nil {
            result[transactionDate] = []
        }
        
        result[transactionDate]!.append(transaction)
    }
    
    let sorted = result.sorted {
        if ($0.key == "Today" || $0.key == "Yesterday") {
            return true
        }
        
        let date0 = parseDate($0.key)
        let date1 = parseDate($1.key)
        
        return date0.compare(date1) == .orderedDescending
    }
    
    return sorted
}

func filterTransactionsInPeriod(period: Period, transactions: [Transaction], periodIndex: Int) -> (transactions: [Transaction], range: ClosedRange<Date>) {
    let interval = intervalForPeriod(period: period, periodIndex: periodIndex)
    
    let range = interval.start ... interval.end
    
    var filteredTransactions: [Transaction] = []

    transactions.forEach { transaction in
        if range.contains(transaction.date) {
            filteredTransactions.append(transaction)
        }
    }
    
    return (transactions: filteredTransactions, range: range)
}
