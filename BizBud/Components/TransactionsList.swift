//
//  TransactionsList.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 1/7/23.
//

import SwiftUI

struct TransactionsList: View {
    var transactions: [Dictionary<String, [Transaction]>.Element]
    
    func getHeaderText(_ date: String) -> String {
        let headerDate = parseDate(date)
        
        if Calendar.current.isDateInToday(headerDate) {
            return "Today"
        }
        
        if Calendar.current.isDateInYesterday(headerDate) {
            return "Yesterday"
        }
        
        return date
    }

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 24) {
                ForEach(Array(transactions), id: \.key) { key, value in
                    VStack(alignment: .leading, spacing: 12) {
                        HStack(alignment: .firstTextBaseline) {
                            Text("\(getHeaderText(key))")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                            Text("SGD \(value.map{ $0.amount }.reduce(0, { $0 + $1 }).roundTo(2))")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Divider()
                        
                        ForEach(value, id: \.id) { transaction in
                            VStack(spacing: 4) {
                                HStack {
                                    Text(transaction.note ?? transaction.category!.name)
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    Text("SGD \(transaction.amount.roundTo(2))")
                                }
                                HStack {
                                    Tag(label: transaction.category!.name)
                                    
                                    Spacer()
                                    
                                    Text(formatDate(transaction.date, format: "HH:mm"))
                                        .font(.body)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.bottom, 12)
                        }
                    }
                }
            }
            .environment(\.layoutDirection, .leftToRight)
            .padding(.horizontal, 16)
        }
    }
}

struct TransactionsList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsList(transactions: [])
    }
}
