//
//  HomePageSwiftUI.swift
//  BizBud
//
//  Created by Shielda Hidajat on 10/06/23.
//
import SwiftUI
import Foundation


struct HomePage: View {
    var body: some View {
        VStack(alignment: .center){
            HStack{
                VStack(alignment : .leading){
                    Text("Welcome,")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    Text("BizBuds!")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .padding()
                
                Spacer()
            }
            .padding()
            
            Revenue()
            
            AddButtons().padding(.all)
            
           // TransactionsList().background(Color.white.shadow(radius:10))
        }
    }
}

let revenue = 5300

struct Revenue: View {
    var body: some View{
            VStack(alignment: .leading){
                Text("Total Revenue")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 50)
                
                Text("$\(revenue)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }.padding(.leading, 30.0).padding(.vertical, 20.0).padding(.trailing, 190.0).background(Color(red: 0.363, green: 0.373, blue: 0.988)).cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
    }
}

struct HomeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 70, height: 70)
            .foregroundColor(Color.white).background(Color.white)
            .clipShape(Circle()).shadow(radius: 10)
    }
}


struct AddButtons: View{
    @State private var showAddView = false
    @State private var showAnalyticsView = false
    
    var body: some View{
        HStack{
            VStack{
                Button(action: { showAddView = true })
                {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .foregroundColor(Color(red: 0.363, green: 0.373, blue: 0.988))
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(Circle()).shadow(radius: 10)
                }
                NavigationLink("", destination:  Add(), isActive: $showAddView)
                
                Text("Add Transaction")
                    .font(.callout)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(width: 100.0)
            }
             
            VStack{
                Button(action: { showAnalyticsView = true })
                {
                    Image(systemName: "chart.line.uptrend.xyaxis.circle")
                        .resizable()
                        .foregroundColor(Color(red: 0.363, green: 0.373, blue: 0.988))
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(Circle()).shadow(radius: 10)
                }
                NavigationLink("", destination:  Analytics(), isActive: $showAnalyticsView)
                
                Text("Statistics\n")
                    .font(.callout)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(width: 100.0)
            }
            
            
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

