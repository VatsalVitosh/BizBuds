//
//  PeriodOverview.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 9/7/23.
//

import SwiftUI

struct PeriodOverview: View {
    var period: String
    var totalForPeriod: Double
    var averageForPeriod: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(period)
                    .font(.title3)
                HStack(spacing: 4) {
                    Text("\(totalForPeriod.roundTo(2))")
                        .font(.headline)
                    Text("SGD")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 8) {
                Text("Avg / Day")
                    .font(.title3)
                HStack(spacing: 4) {
                    Text("\(averageForPeriod.roundTo(2))")
                        .font(.headline)
                    Text("SGD")
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
        }
        .environment(\.layoutDirection, .leftToRight)
        .padding(.horizontal, 16)
    }
}

struct PeriodOverview_Previews: PreviewProvider {
    static var previews: some View {
        PeriodOverview(period: "17 July - 24 July", totalForPeriod: 69, averageForPeriod: 9.86)
    }
}
