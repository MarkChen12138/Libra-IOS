//
//  ProductsView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/12.
//

import Foundation
import SwiftUI

struct ProductsView: View {
    
    @StateObject private var viewModel = ProductsViewModel()
    @State private var selectedProduct: Product = Product(id: 0, name: "default", quality: "default", description: "default", price: "default", category: "default", origin: "default")
    @State private var showProductDetailView: Bool = false
    
    private func segue(product: Product) {
        selectedProduct = product;
        showProductDetailView.toggle()
    }
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                ProductCellView(product: product)
                    .onTapGesture {
                        segue(product: product)
                    }
//                    .contextMenu {
//                        Button("Add to favorites") {
//                            viewModel.addUserFavoriteProduct(productId: product.id)
//                        }
//                    }
                
                if product == viewModel.products.last {
                    ProgressView()
                        .onAppear {
                            viewModel.getProducts()
                        }
                }
            }
        }
        .navigationTitle("Products")
        .onAppear {
//            viewModel.downloadProductsAndUploadToFirebase()
            viewModel.getProducts()
        }
        .background(
            NavigationLink(
                destination: ProductDetailView(product: $selectedProduct),
                isActive: $showProductDetailView,
                label: { EmptyView() })
        )
            }
            
            
}




struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductsView()
        }
    }
}

