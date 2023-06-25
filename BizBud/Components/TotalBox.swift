//
//  TotalBox.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 19/6/23.
//

import SwiftUI

struct TotalBox: View {
    var amount: Double = 720
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Total Revenue")
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .padding(.bottom, 50)
            
            Text("$\(amount.roundTo(2))")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }.padding(.leading, 30.0).padding(.vertical, 20.0).padding(.trailing, 190.0).background(Color(red: 0.363, green: 0.373, blue: 0.988)).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
    }
}

struct TotalBox_Previews: PreviewProvider {
    static var previews: some View {
        TotalBox()
    }
}
