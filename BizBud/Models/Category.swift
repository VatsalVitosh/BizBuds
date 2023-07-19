//
//  Category.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 19/6/23.
//

import Foundation
import SwiftUI
import RealmSwift

class Category: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
