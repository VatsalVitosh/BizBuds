//
//  Statistics.swift
//  BizBud
//
//  Created by Shielda Hidajat on 19/07/23.
//

import Foundation
import SwiftUI
import Charts

struct Statistics: View {
    let Revenues: [ViewMonth] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1), revenue: 100),
        .init(date: Date.from(year: 2023, month: 2, day: 1), revenue: 200),
        .init(date: Date.from(year: 2023, month: 3, day: 1), revenue: 150),
        .init(date: Date.from(year: 2023, month: 4, day: 1), revenue: 300)
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("Statistics")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.all)
                    Chart{
                        ForEach(Revenues){
                            Revenue in
                            BarMark(
                                x: .value("Month", Revenue.date, unit:.month),
                                y: .value("Revenue", Revenue.revenue)
                            )
                            .foregroundStyle(Color.indigo.gradient)
                            .cornerRadius(7)
                        }
                    }
                    .padding(.vertical, 10.0)
                    .frame(width: 300.0, height: 300.0)
                    NavigationLink(destination: FinancialStatement()){
                        Text("View Financial Statement").fontWeight(.semibold).foregroundColor(Color.white).frame(width:250, height:50).background(Color.blue).cornerRadius(10)
                    }
                    HStack(){
                        Text("Accounting Ratios")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.338))
                            .multilineTextAlignment(.leading)
                            .padding(.all, 20.0)
                        Spacer()
                    }
                    HStack(){
                        Text("Current Ratio")
                            .foregroundColor(Color.gray)
                            .padding([.leading, .bottom, .trailing])
                        Spacer()
                    }
                    HStack(){
                        Text("2.1")
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding([.leading, .bottom, .trailing])
                        Spacer()
                    }
                    HStack(){
                        Text("Profit Margin")
                            .foregroundColor(Color.gray)
                            .padding([.leading, .bottom, .trailing])
                        Spacer()
                    }
                    HStack(){
                        Text("55.0%")
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding([.leading, .bottom, .trailing])
                        Spacer()
                    }
                    HStack(){
                        Text("Return on Asset")
                            .foregroundColor(Color.gray)
                            .padding([.leading, .bottom, .trailing])
                        Spacer()
                    }
                    HStack(){
                        Text("5.0%")
                            .font(.title3)
                            .foregroundColor(Color.black)
                            .padding([.leading, .bottom, .trailing])
                        Spacer()
                    }
                }
            }
            
        }
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics()
    }
}

struct ViewMonth: Identifiable{
    let id = UUID()
    let date: Date
    let revenue: Int
}

extension Date{
    static func from(year: Int, month: Int, day: Int) -> Date{
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from:components)!
    }
}
