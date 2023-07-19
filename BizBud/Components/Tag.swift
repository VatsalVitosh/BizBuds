//
//  Tag.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 1/7/23.
//

import SwiftUI

struct Tag: View {
    var label: String
    
    var body: some View {
        Text(label)
            .font(.footnote)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .cornerRadius(8)
    }
}

struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        Tag(label: "Category")
    }
}
