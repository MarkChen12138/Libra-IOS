//
//  ProductsDetailView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/29.
//

import Foundation
import SwiftUI

//struct DetailLoadingView: View {
//    
//    let product = Product
//
//    var body: some View {
//        ZStack {
//            if let product = product {
//                DetailView(product: product)
//            }
//        }
//    }
//    
//}

struct ProductDetailView: View {
    
    @Binding var product: Product
    @State private var showFullDescription: Bool = false
//    private let columns: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
    private let spacing: CGFloat = 30
    
//    init(product: ProductModel) {
//        _viewModel = StateObject(wrappedValue: DetailViewModel(product: product))
//    }
    
    var body: some View {
        ScrollView {
            VStack {
//                ChartView(product: viewModel.product)
//                    .padding(.vertical)

                VStack(spacing: 20) {
                    overviewTitle
                    Divider()
                    descriptionSection
                    infoSection
//                    overviewGrid
                    additionalTitle
                    Divider()
//                    additionalGrid
//                    websiteSection
                }
                .padding()
            }
        }
        .background(
            Color.theme.light
                .ignoresSafeArea()
        )
        .navigationTitle(product.name ?? "N/A")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItems
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ProductDetailView(product: <#T##Binding<Product>#>)
//        }
//    }
//}

extension ProductDetailView {
    
    private var navigationBarTrailingItems: some View {
        Text(product.name ?? "N/A")
                .font(.headline)
                .foregroundColor(Color.theme.dark)
    }
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.dark)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.dark)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descriptionSection: some View {
        ZStack {
            if let productDescription = product.description,
               !productDescription.isEmpty {
                VStack(alignment: .leading) {
                    Text(productDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.dark)

                    Button(action: {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                        }
                    }, label: {
                        Text(showFullDescription ? "Less" : "Read more..")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    })
                    .accentColor(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private var infoSection: some View {
        VStack(spacing: 15) {
            if let productPrice = product.price,
               !productPrice.isEmpty {
                VStack(alignment: .leading) {
                    Text("Product Price")
                        .foregroundColor(Color.theme.green)

                    Text(productPrice)
                        .bold() // 将价格的文本样式调整成加粗

                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            if let productQuality = product.quality,
               !productQuality.isEmpty {
                VStack(alignment: .leading) {
                    Text("Product Quality")
                        .foregroundColor(Color.theme.green)

                    Text(productQuality)
                        .bold()

                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack {
                if let productCategory = product.category,
                   !productCategory.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Product Category")
                            .foregroundColor(Color.theme.green)

                        Text(productCategory)
                            .bold()

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                if let productOrigin = product.origin,
                   !productOrigin.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Product Origin")
                            .foregroundColor(Color.theme.green)

                        Text(productOrigin)
                            .bold()

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }


    
//    private var overviewGrid: some View {
//        LazyVGrid(
//            columns: columns,
//            alignment: .leading,
//            spacing: spacing,
//            pinnedViews: [],
//            content: {
//                ForEach(viewModel.overviewStatistics) { stat in
//                    StatisticView(stat: stat)
//                }
//        })
//    }
//
//    private var additionalGrid: some View {
//        LazyVGrid(
//            columns: columns,
//            alignment: .leading,
//            spacing: spacing,
//            pinnedViews: [],
//            content: {
//                ForEach(viewModel.additionalStatistics) { stat in
//                    StatisticView(stat: stat)
//                }
//        })
//    }
//    
//    private var websiteSection: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            if let websiteString = viewModel.websiteURL,
//               let url = URL(string: websiteString) {
//                Link("Website", destination: url)
//            }
//            
//            if let redditString = viewModel.redditURL,
//               let url = URL(string: redditString) {
//                Link("Reddit", destination: url)
//            }
//            
//        }
//        .accentColor(.blue)
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .font(.headline)
//    }
    
}
