//
//  RealmManager.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 1/7/23.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published var transactions: [Transaction] = []
    @Published var categories: [Category] = []
    
    init() {
        openRealm()
        
        loadTransactions()
        loadCategories()
    }

    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error opening Realm", error)
        }
    }
    
    func loadTransactions() {
        if let localRealm = localRealm {
            let allTransactions = localRealm.objects(Transaction.self).sorted(byKeyPath: "date")
            
            transactions = []
            
            allTransactions.forEach { transaction in
                transactions.append(transaction)
            }
        }
    }
    
    func submitTransaction(_ transaction: Transaction) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    localRealm.add(transaction)
                    
                    loadTransactions()
                    print("Transaction submitted to Realm!", transaction)
                }
            } catch {
                print("Error submitting transaction to Realm: \(error)")
            }
        }
    }
    
    func loadCategories() {
        if let localRealm = localRealm {
            let allCategories = localRealm.objects(Category.self)
            
            categories = []
            
            allCategories.forEach { category in
                categories.append(category)
            }
        }
    }
    
    func submitCategory(_ category: Category) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    localRealm.add(category)
                    
                    loadCategories()
                    print("Category submitted to Realm!", category)
                }
            } catch {
                print("Error submitting category to Realm: \(error)")
            }
        }
    }
    
    func deleteCategory(category: Category) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    localRealm.delete(category)
                    
                    loadCategories()
                    print("Category deleted from Realm!", category)
                }
            } catch {
                print("Error deleting category to Realm: \(error)")
            }
        }
    }
}
