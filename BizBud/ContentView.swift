//
//  ContentView.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 12/6/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    
    var body: some View {
        TabView {
            Transactions(transactions: realmManager.transactions)
                .environmentObject(realmManager)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Analytics()
                .environmentObject(realmManager)
                .tabItem {
                    Label("Analytics", systemImage: "chart.bar")
                }
            
            Add()
                .environmentObject(realmManager)
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
            
            Settings()
                .environmentObject(realmManager)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
