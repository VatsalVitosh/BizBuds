//
//  Financial Statement.swift
//  BizBud
//
//  Created by Shielda Hidajat on 19/07/23.
//

import Foundation
import SwiftUI

struct FinancialStatement: View{
    var body: some View {
        ScrollView(){
            VStack(){
                Text("Statement of Cashflow\nBizBuds\nFor Month Ended in May 2023")
                    .font(.title3)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                Group{
                    HStack(){
                        Text("Operating Activities")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .padding(.all)
                        Spacer()
                    }
                    HStack(){
                        Text("Net Earnings")
                            .font(.body)
                        Spacer()
                        Text("$5300")
                            .font(.body)
                    }
                    .padding(.horizontal, 20.0).padding(.bottom, 2)
                    HStack(){
                        Text("Operating Expenses")
                            .font(.body)
                        Spacer()
                        Text("($300)")
                            .font(.body)
                    }
                    .padding(.horizontal, 20.0).padding(.bottom, 2)
                    HStack(){
                        Text("Net Cashflow from Operating\nactivites")
                            .font(.body)
                        Spacer()
                        Text("$5000")
                            .font(.body)
                    }
                    
                    .padding(.horizontal, 20.0).padding(.bottom, 2)
                    
                }
                Group{
                    HStack(){
                        Text("Investing Activities")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .padding(.all)
                        Spacer()
                    }
                    HStack(){
                        Text("Addition in Assets")
                            .font(.body)
                        Spacer()
                        Text("($150)")
                            .font(.body)
                    }
                    .padding(.horizontal, 20.0).padding(.bottom, 2)
                    HStack(){
                        Text("Net Cashflow from Investing\nactivities")
                            .font(.body)
                        Spacer()
                        Text("($150)")
                            .font(.body)
                    }
                    .padding(.horizontal, 20.0).padding(.bottom, 2)
                    
                }
                Group{
                    HStack(){
                        Text("Financing Activities")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .padding(.all)
                        Spacer()
                    }
                    HStack(){
                        Text("Addition in Assets")
                            .font(.body)
                        Spacer()
                        Text("($150)")
                            .font(.body)
                    }
                    .padding(.horizontal, 20.0).padding(.bottom, 2)
                    HStack(){
                        Text("Net Cashflow from Investing\nactivities")
                            .font(.body)
                        Spacer()
                        Text("($150)")
                            .font(.body)
                    }
                    .padding(.horizontal, 20.0).padding(.bottom, 2)
                    
                }
                Group{
                    HStack(){
                        Text("Net increase in Cash")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .padding(.all)
                        Spacer()
                        Text("$4700")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .padding(.all)
                    }
                    
                }
            }
        }
        .navigationBarTitle("Financial Statement")
    }
}

struct Finance_Previews: PreviewProvider {
    static var previews: some View {
        FinancialStatement()
    }
}
