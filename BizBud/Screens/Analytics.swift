//
//  Analytics.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 18/6/23.
//
import SwiftUI

struct Analytics: View {
    @EnvironmentObject var realmManager: RealmManager
    
    @State private var period: Period = Period.week
    @State private var tabViewSelection = 0
    @State private var transactions: [Transaction] = []
    @State private var pagesRange = 0..<53
    
    func setPagesRange() {
        switch self.period {
        case .day:
            break
        case .week:
            pagesRange = 0..<53
        case .month:
            pagesRange = 0..<12
        case .year:
            pagesRange = 0..<1
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TabView(selection: $tabViewSelection) {
                    ForEach(pagesRange, id: \.self) { index in
                        VStack {
                            PeriodChart(period: period, transactions: transactions, periodIndex: index)
                                .environmentObject(realmManager)
                        }
                    }
                }
                .environment(\.layoutDirection, .rightToLeft)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .id(pagesRange)
            }
            .padding(.top, 16)
            .navigationTitle("Analytics")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Menu {
                        Picker(selection: $period, label: Text("Period"), content: {
                            Text(Period.week.rawValue).tag(Period.week)
                            Text(Period.month.rawValue).tag(Period.month)
                            Text(Period.year.rawValue).tag(Period.year)
                        })
                    } label: {
                        Label("Period", systemImage: "calendar")
                    }
                }
            }
        }
        .onChange(of: period) { _ in
            self.tabViewSelection = 0
            setPagesRange()
        }
    }
}

struct Reports_Previews: PreviewProvider {
    static var previews: some View {
        Analytics()
            .environmentObject(RealmManager())
    }
}
