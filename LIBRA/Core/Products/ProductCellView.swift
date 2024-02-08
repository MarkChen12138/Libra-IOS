//
//  ProductsCellView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/12.
//

import Foundation
import SwiftUI

struct ProductCellView: View {
    
    let product: Product
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            VStack(alignment: .leading, spacing: 4) {
                Text((product.name ?? "n/a"))
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Price: $" + String(product.price ?? "many money"))
                Text("Quality: " + String(product.quality ?? "standard"))
                Text("Category: " + (product.category ?? "n/a"))
            }
            .font(.callout)
            .foregroundColor(.secondary)
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: Product(id: 11, name: "Indonesian Palm Oil", quality: "Versatile", description: "Indonesian Palm Oil is a versatile and widely used vegetable oil. It is a crucial ingredient in the food, cosmetic, and biofuel industries.", price: "Malaysian Palm Oil Price +$50/ton Net", category: "Palm Oil", origin: "Indonesia"))
    }
}
