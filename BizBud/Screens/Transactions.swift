//
//  Transactions.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 18/6/23.
//

import SwiftUI

struct Transactions: View {
    @EnvironmentObject var realmManager: RealmManager
    var transactions: [Transaction]
    
    @State private var totalTransactions: Double = 0
    @State private var filteredTransactions: [Transaction] = []
    @State private var searchQuery = ""
    @State private var timeFilter = Period.week
    let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 96), spacing: 16), count: 3)
    
    func reloadData() {
        filteredTransactions = filterTransactionsInPeriod(period: timeFilter, transactions: realmManager.transactions, periodIndex: 0).transactions
        
        totalTransactions = 0
        
        filteredTransactions.forEach{ transaction in
            totalTransactions += transaction.amount
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 4) {
                HStack {
                    Text("Total for:")
                    Picker("", selection: $timeFilter, content: {
                        Text("Today").tag(Period.day)
                        Text("This Week").tag(Period.week)
                        Text("This Month").tag(Period.month)
                        Text("This Year").tag(Period.year)
                    })
                    .foregroundColor(.white)
                }
                
                VStack(alignment: .leading){
                    Text("Total Revenue:")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 10)
                    
                    Text("$\(totalTransactions.roundTo(2))")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                .padding(.leading, 30.0)
                .padding(.vertical, 20.0)
                .padding(.trailing, 190.0)
                .background(Color(red: 0.363, green: 0.373, blue: 0.988))
                .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                 
                AddButtons().padding(.all)
                
                TransactionsList(transactions: groupTransactionsByDate(filteredTransactions))
                    .id(filteredTransactions)
            }
            .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
            .navigationTitle("Transactions")
        }
        .searchable(
            text: $searchQuery,
            placement: .automatic,
            prompt: "Search transactions"
        )
        .onChange(of: timeFilter) { newFilter in
            reloadData()
        }
        .onAppear {
            reloadData()
        }
    }
}

struct Transcations_Previews: PreviewProvider {
    static var previews: some View {
        Transactions(transactions: RealmManager().transactions)
            .environmentObject(RealmManager())
    }
}
