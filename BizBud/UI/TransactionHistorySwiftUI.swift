//
//  TransactionHistorySwiftUI.swift
//  BizBud
//
//  Created by Shielda Hidajat on 10/06/23.
//

import Foundation
import SwiftUI
import UIKit

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

let testCategory1: Category = Category(name: "Earring")
let testCategory2: Category = Category(name: "Necklace")
let testCategory3: Category = Category(name: "Ring")
let testTransaction1: Transaction = Transaction(amount: 35, category: testCategory1, date: Date())
let testTransaction2: Transaction = Transaction(amount: 45, category: testCategory2, date: Date())
let testTransaction3: Transaction = Transaction(amount: 25, category: testCategory3, date: Date())
var transactions : [Transaction] = [testTransaction1, testTransaction2, testTransaction3]


struct TransactionList: View {
    var body: some View{
        VStack(alignment: .leading){
            Text("Recent Transactions").font(.title2).fontWeight(.bold).foregroundColor(Color.gray).padding(15.0).padding(.top, 10.0)
            List(transactions) { transaction in
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
