//
//  ContentView.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 18/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Transactions()
                .tabItem {
                    Label("Transactions", systemImage: "tray.and.arrow.up.fill")
                }
            
            Analytics()
                .tabItem {
                    Label("Analytics", systemImage: "chart.bar")
                }
            
            Add()
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
            
            Settings()
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
