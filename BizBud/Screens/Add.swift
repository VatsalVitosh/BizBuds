//
//  Add.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 18/6/23.
//

import SwiftUI

struct Add: View {
    @State private var category = "Gold Ring"
    @State private var amount = ""
    @State private var date = Date()
    @State private var note = ""
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
        let max = Date()
        return min...max
    }
    
    func create() {
        hideKeyboard()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker(selection: $category, label: Text(""), content: {
                            Text("Gold Ring").tag("gold rings")
                            Text("Silver Necklace").tag("silver necklaces")
                            Text("Gold Earring").tag("gold earrings")
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
                    create()
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
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        Add()
    }
}
