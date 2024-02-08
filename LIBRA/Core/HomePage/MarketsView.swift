//
//  MarketsView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/29.
//

import Foundation
import SwiftUI

struct MarketsView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                MarketRowView(title: "气体类", systemImageName: "microbe",data: MarketDataBase.gas, color: Color.blue)
                MarketRowView(title: "新能源类", systemImageName: "microbe",data: MarketDataBase.newEnergy, color: Color.green)
                MarketRowView(title: "矿类", systemImageName: "microbe",data: MarketDataBase.mineral, color: Color.gray)
                MarketRowView(title: "油类", systemImageName: "microbe",data: MarketDataBase.oil, color: Color.red)
            }
        }
    }
}

extension MarketsView {
    struct MarketRowView: View {
        var title: String
        var systemImageName: String
        var data: [[String]]
        var color: Color

        var body: some View {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: systemImageName)
                        .font(.title)
                    Text(title)
                        .font(.title)
                }
                HStack {
                    ForEach(data, id: \.self) { item in
                        MarketCellView(color: color, title: item[0], description: item[1])
                    }
                }
            }
        }
    }
}



struct MarketsView_Previews: PreviewProvider {
    static var previews: some View {
        MarketsView()
    }
}

