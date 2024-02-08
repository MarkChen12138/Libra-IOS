//
//  MarketCellView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/29.
//

import Foundation
import SwiftUI

struct MarketCellView: View {
    var color: Color
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(color)
                    .cornerRadius(10) // 边缘钝化
                
                Text(title)
                    .font(.title)
                    .foregroundColor(.white)
            }
            .frame(width: 80, height: 80) // 缩小 20%
            
            Text(description)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 10) // 增加上边距，将 description 文字远离正方形
        }
        .frame(width: 115, height: 115)
    }
}


struct MarketCellView_Previews: PreviewProvider {
    static var previews: some View {
        MarketCellView(color: Color.blue, title: "LNG", description: "LNG期货/现货")
    }
}
