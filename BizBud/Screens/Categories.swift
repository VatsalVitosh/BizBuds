//
//  Categories.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 18/6/23.
//

import SwiftUI

struct Categories: View {
    @State private var newCategoryName: String = ""
    @State private var categories: [Category] = [
        Category(id: 0, name: "Gold Ring"),
        Category(id: 1, name: "Silver Necklace"),
        Category(id: 2, name: "Gold Earring")
    ]
    
    func submit() {
        if newCategoryName.count > 0 {
            categories.append(Category(
                id: categories.count,
                name: newCategoryName)
            )
            newCategoryName = ""
        }
    }
    
    func delete(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(categories) { category in
                    HStack {
                        Text(category.name)
                    }
                }
                .onDelete(perform: delete)
            }
            
            Spacer()
            
            HStack {
                ZStack(alignment: .trailing) {
                    TextField("New Category", text: $newCategoryName)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.done)
                        .onSubmit {
                            submit()
                        }
                    
                    if newCategoryName.count > 0 {
                        Button {
                            newCategoryName = ""
                        } label: {
                            Label("Clear Input", systemImage: "xmark.circle.fill")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.gray)
                                .padding(.trailing, 6)
                        }
                    }
                }
                
                Button {
                    submit()
                } label: {
                    Label("Submit", systemImage: "plus")
                        .labelStyle(.iconOnly)
                }
            }
            .padding(.horizontal, 16)
            .navigationTitle("Categories")
        }
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
