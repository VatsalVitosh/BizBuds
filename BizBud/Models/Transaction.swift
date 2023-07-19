//
//  Transaction.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 19/6/23.
//

import Foundation
import SwiftUI
import RealmSwift

class Transaction: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var amount: Double
    @Persisted var category: Category?
    @Persisted var date: Date
    @Persisted var note: String?
    
    convenience init(amount: Double, category: Category, date: Date, note: String? = nil) {
        self.init()
        self.amount = amount
        self.category = category
        self.date = date
        self.note = note
    }
    
    var dayInWeek: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            let dayInWeek = dateFormatter.string(from: self.date)
            return dayInWeek
        }
    }
    
    var dayInMonth: Int {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            let dayInMonth = Int(dateFormatter.string(from: self.date))!
            return dayInMonth
        }
    }
    
    var month: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            let month = dateFormatter.string(from: self.date)
            return month
        }
    }
    
    var year: Int {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyy"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            let year = Int(dateFormatter.string(from: self.date))!
            return year
        }
    }
}
