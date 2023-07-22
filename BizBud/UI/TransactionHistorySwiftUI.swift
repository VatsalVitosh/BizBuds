//
//  TransactionHistorySwiftUI.swift
//  BizBud
//
//  Created by Shielda Hidajat on 10/06/23.
//

import Foundation
import SwiftUI
import UIKit

var testCategory1 = Category(name: "Earring")
var testCategory2 = Category(name: "Necklace")
var testCategory3 = Category(name: "Ring")
var testTransaction1 = Transaction(amount: 35, category: testCategory1, date: Date())
var testTransaction2 = Transaction(amount: 45, category: testCategory2, date: Date())
var testTransaction3 = Transaction(amount: 25, category: testCategory3, date: Date())
var testTransactions = [testTransaction1, testTransaction2, testTransaction3]

struct TransactionRow: View {
    var trans : Transaction
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Note")
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(.bottom, 1.0)
                HStack{
                    Text("Category").font(.callout)
                    
                    Spacer()
                    
                    Text("$\(trans.amount)").font(.callout)
                }
                
            }
            .padding(.top)
            
            
        }
    }
}

struct TransactionList: View {
    var body: some View{
        VStack(alignment: .leading){
            Text("Recent Transactions").font(.title2).fontWeight(.bold).foregroundColor(Color.gray).padding(15.0).padding(.top, 10.0)
            List(testTransactions) { transaction in
                TransactionRow(trans: transaction).listRowBackground(Color.white)
            }
            
        }
    }
}

struct TransactionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionList()
    }
}
