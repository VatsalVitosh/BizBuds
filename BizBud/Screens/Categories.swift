//
//  Categories.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 18/6/23.
//

import SwiftUI
import RealmSwift

struct Categories: View {
    @EnvironmentObject var realmManager: RealmManager
    
    @State private var invalidDataAlertShowing = false
    @State private var newCategoryName: String = ""
    
    func handleSubmit() {
        if newCategoryName.count > 0 {
            self.realmManager.submitCategory(Category(
                name: newCategoryName
            ))
            newCategoryName = ""
        } else {
            invalidDataAlertShowing = true
        }
    }
    
    func handleDelete(at offsets: IndexSet) {
        if offsets.first != nil {
            realmManager.deleteCategory(category: realmManager.categories[offsets.first!])
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(realmManager.categories, id: \.name) { category in
                    Text(category.name)
                }
                .onDelete(perform: handleDelete)
            }
            
            Spacer()
            
            HStack(spacing: 16) {
                
                ZStack(alignment: .trailing) {

                    TextField("New category", text: $newCategoryName)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.done)
                        .onSubmit {
                            handleSubmit()
                        }
                    
                    if newCategoryName.count > 0 {
                        Button {
                            newCategoryName = ""
                        } label: {
                            Label("Clear input", systemImage: "xmark.circle.fill")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.gray)
                                .padding(.trailing, 6)
                        }
                    }
                }
                
                Button {
                    handleSubmit()
                } label: {
                    Label("Submit", systemImage: "paperplane.fill")
                        .labelStyle(.iconOnly)
                        .padding(6)
                }
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(6)
                .alert("Category name required", isPresented: $invalidDataAlertShowing) {
                    Button("OK", role: .cancel) {
                        invalidDataAlertShowing = false
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            .navigationTitle("Categories")
        }
        .padding(.top, 16)
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
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
            .environmentObject(RealmManager())
    }
}
