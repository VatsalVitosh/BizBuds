//
//  TransactionHistorySwiftUI.swift
//  BizBud
//
//  Created by Shielda Hidajat on 10/06/23.
//

import Foundation
import SwiftUI
import UIKit

struct Transaction: Hashable, Codable, Identifiable{
    var id: String
    var name: String
    var amount: Int
}


struct TransactionRow: View {
    var trans : Transaction
    
    var body: some View {
        ScrollView{
            HStack{
                Text(trans.name)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(.bottom, 1.0)
                
                Spacer()
                
                Text("+$\(trans.amount)").font(.callout)
                
            }
            .padding(.top)
            
            
        }
    }
}

let A : Transaction = Transaction(id : "0", name : "Silver Necklace", amount : 30)
let B : Transaction = Transaction(id : "1", name : "Gold Earring", amount : 80)
let C : Transaction = Transaction(id : "2", name : "Gold Ring", amount : 130)
var transactions : [Transaction] = [A, B, C, B, A, C, C, A, B]


struct TransactionList: View {
    var body: some View{
        VStack(alignment: .leading){
            Text("Recent Transactions").font(.title2).fontWeight(.bold).foregroundColor(Color.gray).padding(15.0).padding(.top, 10.0)
            List(transactions){transaction in
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
