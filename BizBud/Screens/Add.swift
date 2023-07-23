//
//  Add.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 18/6/23.
//

import SwiftUI
import RealmSwift

struct Add: View {
    @EnvironmentObject var realmManager: RealmManager
    
    @State private var selectedType = TransactionType.sale
    @State private var selectedCategory: Category = Category(name: "Create a category first")
    
    @State private var amount = ""
    @State private var date = Date()
    @State private var note = ""
    
    func onAppear() {
        if realmManager.categories.count > 0 {
            self.selectedCategory = realmManager.categories[0]
        }
    }
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
        let max = Date()
        return min...max
    }
    
    func handleCreate() {
        if selectedType == TransactionType.expense {
            self.realmManager.submitTransaction(Transaction(
                amount: -Double(self.amount)!,
                category: self.selectedCategory,
                date: self.date,
                note: self.note.count == 0 ? self.selectedCategory.name : self.note
                ))
        }
        self.realmManager.submitTransaction(Transaction(
            amount: Double(self.amount)!,
            category: self.selectedCategory,
            date: self.date,
            note: self.note.count == 0 ? self.selectedCategory.name : self.note
        ))
        self.amount = ""
        self.date = Date()
        self.note = ""
        hideKeyboard()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    HStack {
                        Text("Transaction Type")
                        Spacer()
                        Picker("", selection: $selectedType, content: {
                            Text("Sale").tag(TransactionType.sale)
                            Text("Expense").tag(TransactionType.expense)
                        })
                    }
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker(selection: $selectedCategory, label: Text(""), content: {
                            if realmManager.categories.count > 0 {
                                ForEach(realmManager.categories) { category in
                                    Text(category.name).tag(category)
                                }
                            } else {
                                Text(selectedCategory.name).tag(selectedCategory)
                            }
                        })
                    }
                    
                    HStack {
                        Text("Amount")
                        Spacer()
                        TextField("Amount", text: $amount)
                            .multilineTextAlignment(.trailing)
                            .submitLabel(.done)
                            .keyboardType(.numberPad)
                    }
                    
                    HStack {
                        Text("Date")
                        Spacer()
                        DatePicker (
                            selection: $date,
                            in: dateClosedRange,
                            displayedComponents: .date,
                            label: { Text("")}
                        )
                    }
                    
                    HStack {
                        Text("Note")
                        Spacer()
                        TextField("Note", text: $note)
                            .multilineTextAlignment(.trailing)
                            .submitLabel(.done)
                    }
                }
                .scrollDisabled(true)
                
                Button {
                    handleCreate()
                } label: {
                    Label("Add Transaction", systemImage: "plus")
                        .labelStyle(.titleOnly)
                        .padding(.horizontal, 44)
                        .padding(.vertical, 12)
                }
                .foregroundColor(.white)
                .background(Color(red: 0.363, green: 0.373, blue: 0.988))
                .cornerRadius(10)
                
                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        hideKeyboard()
                    } label: {
                        Label("Dismiss", systemImage: "keyboard.chevron.compact.down")
                    }
                }
            }
            .navigationTitle("Add Transaction")
        }
        .onAppear {
            onAppear()
        }
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        Add()
            .environmentObject(RealmManager())
    }
}
